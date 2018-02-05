#import <Foundation/Foundation.h>

@class UserSession;
@class UserSessionLoginRequestModel;

@protocol UserSessionGateway

- (UserSession *)loginUser:(UserSessionLoginRequestModel *)requestModel error:(NSError **)error;
@optional
- (void)setUserSession:(UserSession *)userSession;

@end
