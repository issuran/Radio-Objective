//
//  MainScreenTVController.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 19/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//
#import "MusicModel.h"
#import "MainScreenTVController.h"

@interface MainScreenTVController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainScreenTVController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainScreenViewModel = [MainScreenViewModel new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateFromServer" object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated{
    UIBarButtonItem *rightNavButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    
    self.navigationItem.rightBarButtonItem = rightNavButton;
}

- (void) logout {
    if(_mainScreenViewModel.logout){
        [self performSegueWithIdentifier:@"backToLogin" sender:self];
    }
}


- (void) receiveNotification:(NSNotification *) notification{
    if([[notification name] isEqualToString:@"updateFromServer"]){
        [self.tableView reloadData];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_mainScreenViewModel.musicArray.count > 0){
        return _mainScreenViewModel.musicArray.count;
    }
    return 0;
}

// Add the items
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainScreenTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTable"];
    
    if(_mainScreenViewModel.musicArray.count > 0){
        MusicModel *musicSelected = _mainScreenViewModel.musicArray[indexPath.row];
        
        cell.lblTitle.text = musicSelected.artist.name;
        
        cell.lblDetail.text = musicSelected.trackName;
        
        NSString *stringUrl = musicSelected.image.text;
        
        [stringUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
        
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:stringUrl]  placeholderImage:[UIImage imageNamed:@"image_small"]];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
