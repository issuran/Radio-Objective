//
//  LoginViewModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 19/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginController.h"
@import FirebaseAuth;

@interface LoginViewModel ()

@end

@implementation LoginViewModel

- (instancetype) init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

// As Views holds reference to the ViewModel, so makes sense initialize our View, given a ViewModel
- (void) initialize {
    self.username = @"";
    self.password = @"";
    
    self.initialStateShowLabel = YES;
    self.isHiddenPassword = YES;
    self.isSignIn = YES;
    
    self.btLoginText = @"Logar";
    self.btRegisterText = @"Registrar";
    self.lblHintText = @"Talvez queira criar uma conta";
}

- (void) swapOptions {
    
    if(self.isSignIn){
        self.btRegisterText = @"Registrar";
        self.btLoginText = @"Logar";
        self.lblHintText = @"Já tem conta?";
        self.isHiddenConfirmPasswordFields = NO;
        self.isSignIn = NO;
    } else {
        self.btRegisterText = @"Logar";
        self.btLoginText = @"Registrar";
        self.lblHintText = @"Talvez queira criar uma conta";
        self.isHiddenConfirmPasswordFields = YES;
        self.isSignIn = YES;
    }
}

- (void) signIn : (NSString *)username forPassword:(NSString *)password{
    
    self.username = username;
    self.password = password;
    
    [[FIRAuth auth] signInWithEmail: self.username
                           password: self.password
                           completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                               if(error == nil){
                                   [self signUserIn: YES];
                                   NSLog(@"Sign In - Sucess");
                               } else{
                                   NSLog(@"Error: %@", error.localizedDescription);
                                   [self signUserIn: NO];
                                   NSLog(@"Sign In - Failed");
                               }
                           }];
}

- (void) signUp : (NSString *)username forPassword:(NSString *)password;{
    
    self.username = username;
    self.password = password;
    
    [[FIRAuth auth] createUserWithEmail: username
                               password: password
                               completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                                   if(error == nil){
                                       [self signUserUp: YES];
                                       NSLog(@"Sign Up - Sucess");
                                   } else{
                                       NSLog(@"Error: %@", error.localizedDescription);
                                       [self signUserUp: NO];
                                       NSLog(@"Sign Up - Failed");
                                   }
                               }];
}

- (void) signUserIn: (BOOL) isSuccess{
    self.isUserLogged = isSuccess;
}

- (void) signUserUp: (BOOL) isSuccess{
    self.isUserCreated = isSuccess;
}

@end
