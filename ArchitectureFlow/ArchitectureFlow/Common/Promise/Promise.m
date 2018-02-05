#import "Promise.h"

@implementation Promise

+ (instancetype)startOnBackgroundWithCompletionBlock:(void(^)(void))blockName {
    // Abstracting a framework - any third party implementation will do
    return nil;
}

- (BOOL)isInProgress {
    return NO;
}

- (void)cancelOperation{}

@end
