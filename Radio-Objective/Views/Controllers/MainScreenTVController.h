//
//  MainScreenTVController.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 19/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreenViewModel.h"
#import "MainScreenTVCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MainScreenTVController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MainScreenViewModel *mainScreenViewModel;

@end
