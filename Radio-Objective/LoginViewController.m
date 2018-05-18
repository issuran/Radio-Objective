//
//  LoginViewController.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 17/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "LoginViewController.h"
@import FirebaseAuth;

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *edLogin;
@property (weak, nonatomic) IBOutlet UITextField *edPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *edConfirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *btLogar;
@property (weak, nonatomic) IBOutlet UIButton *btRegistrar;

@end

@implementation LoginViewController

bool isSignIn = TRUE;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.lblConfirmPassword setHidden:YES];
    [self.edConfirmPassword setHidden:YES];
    
    [self.btLogar setTitle:@"Logar" forState:UIControlStateNormal];
    [self.btRegistrar setTitle:@"Registrar" forState:UIControlStateNormal];
    
    self.edPassword.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)signInUp:(id)sender {
    
    NSString *email = [self.edLogin text];
    NSString *password = [self.edPassword text];
    
    // Get user profile
    // FIRUser *user = [FIRAuth auth].currentUser;
    
    if(isSignIn) {
        
        // Sign in user
        [[FIRAuth auth] signInWithEmail:email
                        password:password
                        completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                //code
                            NSObject *teste = [user email];
        }];
        
    } else {
     
        // Create user
        [[FIRAuth auth] createUserWithEmail:email
                        password:password
                        completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                //code
                            NSObject *teste = [user email];
        }];
    }
}

- (IBAction)swapUserLoginOperation:(id)sender {
    // Swap between login and register
    if(isSignIn){
        isSignIn = FALSE;
        
        [self.lblConfirmPassword setHidden:NO];
        [self.edConfirmPassword setHidden:NO];
        
        
        [self.btLogar setTitle:@"Registrar" forState:UIControlStateNormal];
        [self.btRegistrar setTitle:@"Logar" forState:UIControlStateNormal];
    } else {
        isSignIn = TRUE;
        
        [self.lblConfirmPassword setHidden:YES];
        [self.edConfirmPassword setHidden:YES];
        
        [self.btLogar setTitle:@"Logar" forState:UIControlStateNormal];
        [self.btRegistrar setTitle:@"Registrar" forState:UIControlStateNormal];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
