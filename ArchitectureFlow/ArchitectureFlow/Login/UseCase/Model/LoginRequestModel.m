#import "LoginRequestModel.h"

@implementation LoginRequestModel

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password stayLoggedIn:(BOOL)stayLoggedIn {
    self = [super init];
    if (self) {
        _username = [username copy];
        _password = [password copy];
        _stayLoggedIn = stayLoggedIn;
    }
    return self;
}

@end
