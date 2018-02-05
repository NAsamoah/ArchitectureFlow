
#import "LoginPresenter.h"
#import "Login.h"
#import "LoginView.h"
#import "LoginViewModel.h"
#import "LoginRequestModel.h"
#import "LoginOutput.h"
#import "Promise.h"

@interface LoginPresenter () <LoginOutput>

@property (nonatomic, weak) id<LoginView> view;
@property (nonatomic, weak) id<LoginViewModel> viewModel;
@property (nonatomic, weak) id<Login> interactor;
@property (nonatomic, weak) Promise *loginPromise;

@end

@implementation LoginPresenter

- (void)attachView:(id<LoginView>)view viewModel:(id<LoginViewModel>)viewModel {
    self.view = view;
    self.viewModel = viewModel;
    
}
- (void)detachView {
    self.view = nil;
    self.viewModel = nil;
}

- (void)loginTapped {
    NSString *username = [self.viewModel username];
    NSString *password = [self.viewModel password];
    BOOL stayLoggedIn = [self.viewModel stayLoggedIn];
    
    LoginRequestModel *model = [[LoginRequestModel alloc] initWithUsername:username password:password stayLoggedIn:stayLoggedIn];
    
    if (![self.loginPromise isInProgress]) {
        self.loginPromise = [self.interactor executeWithRequest:model output:self];
    }
}

- (void)viewWillDisappear {
    [self.loginPromise cancelOperation];
}

#pragma mark - Login Output

- (void)loginRequestInvalid:(NSArray *)errors {
    [self.view displayLoginErrorMessage:@""];
}

- (void)loginPasswordEncryptionFailed {
    [self.view displayLoginErrorMessage:@""];
}

- (void)loginUserSessionCreationFailed:(NSError *)error {
    [self.view displayLoginErrorMessage:@""];
}

- (void)loginUserSessionCreationSuccessful {
    [self.view navigateToHomeScreen];
}

@end
