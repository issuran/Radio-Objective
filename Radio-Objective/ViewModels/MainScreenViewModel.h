//
//  MainScreenViewModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TracksModel.h"

@interface MainScreenViewModel : NSObject

@property (strong, nonatomic) NSMutableArray *music;
@property (strong, nonatomic) NSMutableArray *artist;
@property (strong, nonatomic) NSMutableArray *image;
@property (strong, nonatomic) TracksModel *tracksModel;
@property (strong, nonatomic) NSMutableArray *musicArray;

- (void) populateMusicAndArtistsArray;

@end
