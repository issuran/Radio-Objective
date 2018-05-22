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
    
    self.isUserLogged = [FIRAuth auth].currentUser;
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

- (BOOL) signIn : (NSString *)username forPassword:(NSString *)password{
    
    self.username = username;
    self.password = password;
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    [[FIRAuth auth] signInWithEmail: self.username
                           password: self.password
                           completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                               if(error == nil){
                                   [self signUserIn: YES];
                                   NSLog(@"Sign In - Sucess");
                                   dispatch_semaphore_signal(sem);
                               } else{
                                   NSLog(@"Error: %@", error.localizedDescription);
                                   [self signUserIn: NO];
                                   NSLog(@"Sign In - Failed");
                                   dispatch_semaphore_signal(sem);
                               }
                           }];
    
    while (dispatch_semaphore_wait(sem, DISPATCH_TIME_NOW)) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    }
    
    return self.isUserLogged;
}

- (BOOL) signUp : (NSString *)username forPassword:(NSString *)password;{
    
    self.username = username;
    self.password = password;
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    [[FIRAuth auth] createUserWithEmail: username
                               password: password
                               completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                                   if(error == nil){
                                       [self signUserUp: YES];
                                       NSLog(@"Sign Up - Sucess");
                                       dispatch_semaphore_signal(sem);
                                   } else{
                                       NSLog(@"Error: %@", error.localizedDescription);
                                       [self signUserUp: NO];
                                       NSLog(@"Sign Up - Failed");
                                       dispatch_semaphore_signal(sem);
                                   }
                               }];
    
    while (dispatch_semaphore_wait(sem, DISPATCH_TIME_NOW)) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    }
    
    return self.isUserCreated;
}

- (void) signUserIn: (BOOL) isSuccess{
    self.isUserLogged = isSuccess;
}

- (void) signUserUp: (BOOL) isSuccess{
    self.isUserCreated = isSuccess;
}

@end
