//
//  LoginViewModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 19/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewModel : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

@property (assign, nonatomic) BOOL initialStateShowLabel;
@property (assign, nonatomic) BOOL isHiddenPassword;
@property (assign, nonatomic) BOOL isSignIn;
@property (assign, nonatomic) BOOL isHiddenConfirmPasswordFields;
@property (assign, nonatomic) BOOL isUserLogged;
@property (assign, nonatomic) BOOL isUserCreated;

@property (strong, nonatomic) NSString *btLoginText;
@property (strong, nonatomic) NSString *btRegisterText;
@property (strong, nonatomic) NSString *lblHintText;

- (void) signUserIn: (BOOL) isSuccess;
- (void) signUserUp: (BOOL) isSuccess;

- (void) signIn : (NSString *)username forPassword:(NSString *)password;
- (void) signUp : (NSString *)username forPassword:(NSString *)password;

- (void) swapOptions;

@end
