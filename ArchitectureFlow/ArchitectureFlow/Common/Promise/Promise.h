#import <Foundation/Foundation.h>

@interface Promise : NSObject

+ (instancetype)startOnBackgroundWithCompletionBlock:(void(^)(void))blockName;
- (BOOL)isInProgress;
- (void)cancelOperation;
@end
