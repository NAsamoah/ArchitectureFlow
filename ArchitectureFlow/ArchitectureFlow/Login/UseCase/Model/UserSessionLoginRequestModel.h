//
#import <Foundation/Foundation.h>

@interface UserSessionLoginRequestModel : NSObject

@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSString *encryptedPassword;
@property (nonatomic, readonly) BOOL stayLoggedIn;

- (instancetype)initWithUsername:(NSString *)username encryptedPassword:(NSString *)encryptedPassword stayLoggedIn:(BOOL)stayLoggedIn;

@end
