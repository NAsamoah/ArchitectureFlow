#import <Foundation/Foundation.h>

@class UserSession;

@interface RemoteUserSessionMapper : NSObject

- (UserSession *)map:(NSDictionary *)JSONDictionary;

@end
