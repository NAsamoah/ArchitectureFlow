#import <Foundation/Foundation.h>

@class Encryption;

@protocol EncryptionGateway

- (Encryption *)createPasswordEncryption;

@end
