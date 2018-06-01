//
//  LoginTests.m
//  Radio-ObjectiveTests
//
//  Created by Tiago Oliveira on 31/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginViewModel.h"

@interface LoginTests : XCTestCase

@property LoginViewModel *loginViewModel;

@end

@implementation LoginTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _loginViewModel = [[LoginViewModel alloc]init];
}

- (void)testLogin {
    NSString *username = @"teste@teste.com";
    NSString *password = @"123456";
    BOOL expectedResult = YES;
    
    BOOL result = [_loginViewModel signIn:username forPassword:password];
    
    XCTAssertEqual(expectedResult, result);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
