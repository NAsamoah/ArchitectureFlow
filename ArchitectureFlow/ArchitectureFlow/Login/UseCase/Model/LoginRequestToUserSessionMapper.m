
#import "LoginRequestToUserSessionMapper.h"

@implementation LoginRequestToUserSessionMapper

- (UserSessionLoginRequestModel *)map:(LoginRequestModel *)loginRequestModel encryptedPassword:(NSString *)encryptedPassword {
    return [[UserSessionLoginRequestModel alloc] initWithUsername:loginRequestModel.username encryptedPassword:encryptedPassword stayLoggedIn:loginRequestModel.stayLoggedIn];
    
}

@end
