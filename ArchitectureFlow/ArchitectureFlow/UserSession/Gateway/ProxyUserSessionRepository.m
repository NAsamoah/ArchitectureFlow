#import "ProxyUserSessionRepository.h"
#import "LocalUserSessionRepository.h"
#import "RemoteUserSessionRepository.h"

@interface ProxyUserSessionRepository ()

@property (nonatomic) LocalUserSessionRepository *localRepository;
@property (nonatomic) RemoteUserSessionRepository *remoteRepository;

@end

@implementation ProxyUserSessionRepository

- (instancetype)initWithLocalRepository:(LocalUserSessionRepository *)localRepository remoteRepository:(RemoteUserSessionRepository *)remoteRepository {
    self = [super init];
    if (self) {
        _localRepository = localRepository;
        _remoteRepository = remoteRepository;
    }
    return self;
}

- (UserSession *)loginUser:(UserSessionLoginRequestModel *)requestModel error:(NSError *__autoreleasing *)error {
    
    UserSession *userSession = [self.localRepository loginUser:requestModel error:error];
    if (!userSession) {
        userSession = [self.remoteRepository loginUser:requestModel error:error];
    }
    return userSession;
}


@end
