
#import <Foundation/Foundation.h>

@class UserSessionLoginRequestModel;

@interface UserSessionLoginRequestToNSURLRequestMapper : NSObject

- (NSURLRequest *)map:(UserSessionLoginRequestModel *)loginRequestModel;

@end
