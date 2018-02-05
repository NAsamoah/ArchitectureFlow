#import <Foundation/Foundation.h>

@protocol TrackingGateway

- (void)trackEvent:(NSString *)event;

@end
