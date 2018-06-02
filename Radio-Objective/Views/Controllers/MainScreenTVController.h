//
//  MainScreenTVController.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 19/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopMusicsViewModel.h"
#import "MainScreenTVCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MainScreenTVController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) TopMusicsViewModel *topMusicsViewModel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
