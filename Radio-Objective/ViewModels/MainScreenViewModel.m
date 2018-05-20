//
//  MainScreenViewModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "MainScreenViewModel.h"

@implementation MainScreenViewModel

- (instancetype) init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

// As Views holds reference to the ViewModel, so makes sense initialize our View, given a ViewModel
- (void) initialize {
    self.music =  @[@"Starboy", @"One Kiss", @"Habits", @"The Less I Know The Better"];
    self.artist =  @[@"The Weeknd", @"Dua Lipa", @"Tove Lo", @"Tame Impala"];
}

@end
