
#import <Foundation/Foundation.h>

@protocol RemoteUserSessionService

- (NSDictionary *)loginUserSession:(NSURLRequest *)loginRequest;

@end
