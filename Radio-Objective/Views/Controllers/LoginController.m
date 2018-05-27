//
//  LoginViewController.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 17/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *edLogin;
@property (weak, nonatomic) IBOutlet UITextField *edPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *edConfirmPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblHintMessage;
@property (weak, nonatomic) IBOutlet UIButton *btLogar;
@property (weak, nonatomic) IBOutlet UIButton *btRegistrar;

@end

@implementation LoginController

typedef enum{
    login
} Route;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _loginViewModel = [LoginViewModel new];
    
    [self bindViewModel];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    if(_loginViewModel.isUserLogged){
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }
    
}

- (void) bindViewModel{
    self.edLogin.text = _loginViewModel.username;
    self.edPassword.text = _loginViewModel.password;
    
    [self.lblConfirmPassword setHidden: _loginViewModel.initialStateShowLabel];
    [self.edConfirmPassword setHidden: _loginViewModel.initialStateShowLabel];
    
    [self.btLogar setTitle: _loginViewModel.btLoginText forState:UIControlStateNormal];
    [self.btRegistrar setTitle: _loginViewModel.btRegisterText forState:UIControlStateNormal];
    [self.lblHintMessage setText: _loginViewModel.lblHintText];
    
    self.edPassword.secureTextEntry = _loginViewModel.isHiddenPassword;
    self.edConfirmPassword.secureTextEntry = _loginViewModel.isHiddenPassword;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)signInUp:(id)sender {
    
    // Get user profile
    // FIRUser *user = [FIRAuth auth].currentUser;
    
    if(_loginViewModel.isSignIn) {
        
        // Sign in user
        if ([_loginViewModel signIn:[self.edLogin text] forPassword:[self.edPassword text]]) {
            [self performSegueWithIdentifier:@"loginSegue" sender:sender];
        }
        
    } else {
     
        // Create user
        if ([_loginViewModel signUp:[self.edLogin text] forPassword:[self.edPassword text]]) {
            [self performSegueWithIdentifier:@"loginSegue" sender:sender];
        }
    }
}

- (IBAction)swapUserLoginOperation:(id)sender {
    // Swap between login and register
    [_loginViewModel swapOptions];
        
    [self.lblConfirmPassword setHidden: _loginViewModel.isHiddenConfirmPasswordFields];
    [self.edConfirmPassword setHidden: _loginViewModel.isHiddenConfirmPasswordFields];
    
    [self.lblHintMessage setText: _loginViewModel.lblHintText];
    [self.btLogar setTitle: _loginViewModel.btRegisterText forState:UIControlStateNormal];
    [self.btRegistrar setTitle: _loginViewModel.btLoginText forState:UIControlStateNormal];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
