#import <Foundation/Foundation.h>

@class Promise;
@class LoginRequestModel;
@protocol LoginOutput;

@protocol Login

- (Promise *)executeWithRequest:(LoginRequestModel *)requestModel output:(id <LoginOutput>)output;

@end
