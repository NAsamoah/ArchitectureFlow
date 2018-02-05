#import <Foundation/Foundation.h>
#import "UserSessionGateway.h"

@class LocalUserSessionRepository;
@class RemoteUserSessionRepository;

@interface ProxyUserSessionRepository : NSObject <UserSessionGateway>

- (instancetype)initWithLocalRepository:(LocalUserSessionRepository *)localRepository remoteRepository:(RemoteUserSessionRepository *)remoteRepository;

@end
