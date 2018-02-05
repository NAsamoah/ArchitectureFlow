#import "LocalUserSessionRepository.h"
#import "UserSessionLoginRequestModel.h"
#import "UserSession.h"

@interface LocalUserSessionRepository ()

@property (nonatomic) NSMutableDictionary *userSessions;

@end

@implementation LocalUserSessionRepository

- (UserSession *)loginUser:(UserSessionLoginRequestModel *)requestModel error:(NSError *__autoreleasing *)error {
    
    UserSession *userSession = [self.userSessions objectForKey:requestModel.username]; //
    if (!userSession) {
        return nil;
    }
    
    // NICOLA
    if (userSession.validUntilDate <= [NSDate timeIntervalSinceReferenceDate]) {
        [self.userSessions removeObjectForKey:requestModel.username];
        return nil;
    }
    
    return userSession;
}

- (void)setUserSession:(UserSession *)userSession {
    [self.userSessions setObject:userSession forKey:userSession.username];
}


@end
