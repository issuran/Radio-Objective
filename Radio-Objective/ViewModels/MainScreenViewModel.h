//
//  MainScreenViewModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TracksModel.h"
#import "ArtistsListModel.h"
#import "Constants.h"
#import "APIService.h"

@interface MainScreenViewModel : NSObject

@property (strong, nonatomic) TracksModel *tracksModel;
@property (strong, nonatomic) ArtistsListModel *artistsListModel;
@property (strong, nonatomic) NSMutableArray *musicArray;
@property (strong, nonatomic) NSMutableArray *artistArray;
@property (strong, nonatomic) APIService *service;

- (void) populateMusicsArray;
- (void) populateArtistsArray;
- (bool) logout;
- (void) callTopMusics;
- (BOOL) processTopMusicCallback;
- (void) callTopArtists;
- (BOOL) processTopArtistsCallback;

@end
