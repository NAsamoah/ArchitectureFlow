
#import "UserSessionLoginRequestModel.h"

@implementation UserSessionLoginRequestModel

- (instancetype)initWithUsername:(NSString *)username encryptedPassword:(NSString *)encryptedPassword stayLoggedIn:(BOOL)stayLoggedIn {
    self = [super init];
    if (self) {
        _username = [username copy];
        _encryptedPassword = [encryptedPassword copy];
        _stayLoggedIn = stayLoggedIn;
    }
    return self;

}

@end
