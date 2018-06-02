//
//  TopSongsTests.m
//  Radio-ObjectiveTests
//
//  Created by Tiago Oliveira on 31/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TopMusicsViewModel.h"

@interface TopSongsTests : XCTestCase

@property TopMusicsViewModel *topMusicsViewModel;

@end

@implementation TopSongsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _topMusicsViewModel = [[TopMusicsViewModel alloc]init];
}

- (void) testArraysNotNil {
    XCTAssertNotNil(_topMusicsViewModel.musicArray);
    XCTAssertNotNil(_topMusicsViewModel.artistArray);
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
