
#import <Foundation/Foundation.h>

@protocol LoginViewModel

- (NSString *)username;
- (NSString *)password;
- (BOOL)stayLoggedIn;


@end
