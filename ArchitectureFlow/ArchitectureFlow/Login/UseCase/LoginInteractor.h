#import <Foundation/Foundation.h>
#import "Login.h"

@class LoginRequestToUserSessionMapper;
@protocol EncryptionGateway;
@protocol UserSessionGateway;

@interface LoginInteractor : NSObject <Login>

- (instancetype)initWithEncryptionGateway:(id <EncryptionGateway>)encryptionGateway userSessionGateway:(id <UserSessionGateway>)userSessionGateway loginRequestToUserSessionMapper:(LoginRequestToUserSessionMapper *)loginRequestToUserSessionMapper trackingGateway:(id <TrackingGateway>)trackingGateway;

@end
