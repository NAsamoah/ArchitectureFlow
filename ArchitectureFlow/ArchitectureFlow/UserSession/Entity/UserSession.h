
#import <Foundation/Foundation.h>

@interface UserSession : NSObject

@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSTimeInterval validUntilDate;

- (NSNumber *)userSessionID;

@end
