#import "LoginViewController.h"
#import "LoginPresenter.h"

@interface LoginViewController ()

@property (nonatomic) LoginPresenter *presenter;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISwitch *stayLoggedInSwitch;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginButtonTapped:(id)sender {
    
    [self.presenter loginTapped];
}

#pragma mark - Login View Model
- (NSString *)username {
    return self.emailTextField.text;;
}
- (NSString *)password {
    return self.passwordTextField.text;
}

- (BOOL)stayLoggedIn {
    return self.stayLoggedInSwitch.on;
}

#pragma mark - Login
- (void)navigateToHomeScreen {
    // Navigate to somewhere once successfully logged in
}

- (void)displayLoginErrorMessage:(NSString *)message {
    // Show UIAlert
}


@end
