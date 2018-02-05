#import "RemoteUserSessionRepository.h"
#import "RemoteUserSessionMapper.h"
#import "UserSessionLoginRequestToNSURLRequestMapper.h"
#import "RemoteUserSessionService.h"
#import "UserSession.h"

@interface RemoteUserSessionRepository ()

@property (nonatomic) RemoteUserSessionMapper *remoteUserSessionMapper;
@property (nonatomic) UserSessionLoginRequestToNSURLRequestMapper *NSURLRequestMapper;
@property (nonatomic) id<RemoteUserSessionService> service;

@end

@implementation RemoteUserSessionRepository

- (UserSession *)loginUser:(UserSessionLoginRequestModel *)requestModel error:(NSError *__autoreleasing *)error {
    
    NSURLRequest *request = [self.NSURLRequestMapper map:requestModel];
    NSDictionary *JSONResponse = [self.service loginUserSession:request];
    
    UserSession *userSession = [self.remoteUserSessionMapper map:JSONResponse];
    return userSession;
}

@end
