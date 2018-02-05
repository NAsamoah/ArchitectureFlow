
#import <Foundation/Foundation.h>

@protocol LoginView

- (void)navigateToHomeScreen;
- (void)displayLoginErrorMessage:(NSString *)message;

@end
