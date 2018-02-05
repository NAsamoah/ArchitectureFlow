#import "LoginInteractor.h"
#import "Encryption.h"
#import "EncryptionGateway.h"
#import "Promise.h"
#import "LoginRequestModel.h"
#import "LoginOutput.h"
#import "UserSession.h"
#import "UserSessionGateway.h"
#import "UserSessionLoginRequestModel.m"
#import "LoginRequestToUserSessionMapper.h"
#import "TrackingGateway.h"

@interface LoginInteractor ()

@property (nonatomic) id <EncryptionGateway>encryptionGateway;
@property (nonatomic) id <UserSessionGateway>userSessionGateway;
@property (nonatomic) id <TrackingGateway>trackingGateway;
@property (nonatomic) LoginRequestToUserSessionMapper *requestToUserSessionMapper;

@end

@implementation LoginInteractor

- (instancetype)initWithEncryptionGateway:(id <EncryptionGateway>)encryptionGateway userSessionGateway:(id <UserSessionGateway>)userSessionGateway loginRequestToUserSessionMapper:(LoginRequestToUserSessionMapper *)loginRequestToUserSessionMapper trackingGateway:(id <TrackingGateway>)trackingGateway {
    self = [super init];
    if (self) {
        _encryptionGateway = encryptionGateway;
        _userSessionGateway = userSessionGateway;
        _requestToUserSessionMapper = loginRequestToUserSessionMapper;
        _trackingGateway = trackingGateway;
    }
    return self;
}

#pragma mark - Login
- (Promise *)executeWithRequest:(LoginRequestModel *)requestModel output:(id <LoginOutput>)output {
    
    return [Promise startOnBackgroundWithCompletionBlock:^{
        
        NSArray *errors = [self validateRequest:requestModel];
        if (errors.count > 0) {
            [output loginRequestInvalid:errors];
            return;
        } else {
            [output loginRequestValid];
        }
        
        NSError *encryptionError = nil;
        Encryption *encryption = [self.encryptionGateway createPasswordEncryption];
        NSString *encryptedPassword = [encryption encrypt:requestModel.password error:&encryptionError];
        if (encryptionError) {
            [output loginPasswordEncryptionFailed];
            return;
        }
        
        NSError *gatewayError = nil;
        UserSessionLoginRequestModel *userSessionLoginRequestModel = [self.requestToUserSessionMapper map:requestModel encryptedPassword:encryptedPassword];
        UserSession *userSession = [self.userSessionGateway loginUser:userSessionLoginRequestModel error:&gatewayError];
        if (gatewayError) {
            [output loginUserSessionCreationFailed:gatewayError];
            return;
        }
        
        [output loginUserSessionCreationSuccessful];
        [self.trackingGateway trackEvent:[NSString stringWithFormat:@"User(%@) has logged in", userSession.userSessionID]]; // In a real app, a much more complex object would be passed
        
    }];
}

#pragma mark - Private Methods
- (NSArray *)validateRequest:(LoginRequestModel *)requestModel {
    
    NSMutableArray *errorList = [NSMutableArray new];
    // Validate user email
    if (![self validEmail:requestModel.username]) {
        [errorList addObject:[NSError errorWithDomain:@"EmailDoesNotMatchPatternErrorDomain" code:1 userInfo:nil]];
    }
    // Validate password
    if (![self validatePassword:requestModel.password]) {
        [errorList addObject:[NSError errorWithDomain:@"PasswordTooShortErrorDomain" code:2 userInfo:nil]];
    }
    
    return [errorList copy];
}

- (BOOL)validEmail:(NSString *)checkString {
    // Validation stolen from https://stackoverflow.com/questions/3139619/check-that-an-email-address-is-valid-on-ios
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL)validatePassword:(NSString *)password {
    return (password.length > 2);
}



@end
