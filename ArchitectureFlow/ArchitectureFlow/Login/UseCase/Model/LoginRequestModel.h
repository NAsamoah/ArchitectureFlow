
#import <Foundation/Foundation.h>

@interface LoginRequestModel : NSObject

@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSString *password;
@property (nonatomic, readonly) BOOL stayLoggedIn;

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password stayLoggedIn:(BOOL)stayLoggedIn;

@end
