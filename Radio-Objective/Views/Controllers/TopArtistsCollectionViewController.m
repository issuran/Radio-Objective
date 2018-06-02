//
//  TopArtistsCollectionViewController.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 29/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "TopArtistsCollectionViewController.h"
#import "TopArtistsCollectionViewCell.h"
#import "ArtistsModel.h"

@interface TopArtistsCollectionViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TopArtistsCollectionViewController

static NSString * const reuseIdentifier = @"cellCollection";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainScreenViewModel = [MainScreenViewModel new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateArtistsFromServer" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callbackDownloadNotification:) name:@"downloadTopArtistsFromServer" object:nil];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}
//
//- (void)viewDidAppear:(BOOL)animated{
//    UIBarButtonItem *rightNavButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
//    
//    self.navigationItem.rightBarButtonItem = rightNavButton;
//}

- (IBAction)logoutUser:(id)sender {
    if(_mainScreenViewModel.logout){
        [self performSegueWithIdentifier:@"backToLogin" sender:self];
    }
}

- (void) receiveNotification:(NSNotification *) notification{
    if([[notification name] isEqualToString:@"updateArtistsFromServer"]){
        [self.collectionView reloadData];
    }
}

- (void) callbackDownloadNotification:(NSNotification *) notification{
    if([[notification name] isEqualToString:@"downloadTopArtistsFromServer"]){
        if([self.mainScreenViewModel processTopArtistsCallback]){
            [self.mainScreenViewModel populateArtistsArray];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Amount of sections - I want `n` sections (rows)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (_mainScreenViewModel.artistArray.count > 0) {
        return _mainScreenViewModel.artistArray.count;
    };
    return 0;
}

// Amount of items per section - each section gonna have 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TopArtistsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(_mainScreenViewModel.artistArray.count > 0){
        ArtistsModel *artistSelected = _mainScreenViewModel.artistArray[indexPath.section + indexPath.row];
    
        NSString *stringUrl = artistSelected.image.text;
        
        [stringUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
        
        // Configure the cell
        cell.artistName.text = artistSelected.artistName;
        
        [cell.imgArtistView sd_setImageWithURL:[NSURL URLWithString:stringUrl]  placeholderImage:[UIImage imageNamed:@"artists"]];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
