#import <Foundation/Foundation.h>
#import "UserSessionLoginRequestModel.h"
#import "LoginRequestModel.h"

@interface LoginRequestToUserSessionMapper : NSObject

- (UserSessionLoginRequestModel *)map:(LoginRequestModel *)loginRequestModel encryptedPassword:(NSString *)encryptedPassword;

@end
