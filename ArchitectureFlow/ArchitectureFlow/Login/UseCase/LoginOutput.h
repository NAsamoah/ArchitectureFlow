#import <Foundation/Foundation.h>

@protocol LoginOutput

- (void)loginRequestInvalid:(NSArray *)errors;
- (void)loginPasswordEncryptionFailed;
- (void)loginUserSessionCreationFailed:(NSError *)error;
- (void)loginUserSessionCreationSuccessful;

@optional
- (void)loginRequestValid;

@end
