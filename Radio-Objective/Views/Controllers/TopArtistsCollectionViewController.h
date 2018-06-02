//
//  TopArtistsCollectionViewController.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 29/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopArtistsViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TopArtistsCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) TopArtistsViewModel *topArtistsViewModel;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
