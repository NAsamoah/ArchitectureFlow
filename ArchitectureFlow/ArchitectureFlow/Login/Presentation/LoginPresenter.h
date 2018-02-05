
#import <Foundation/Foundation.h>

@protocol LoginView;
@protocol LoginViewModel;

@interface LoginPresenter : NSObject

- (void)attachView:(id<LoginView>)view viewModel:(id<LoginViewModel>)viewModel;
- (void)detachView;

- (void)loginTapped;
- (void)viewWillDisappear;
@end
