//
//  TopMusicsViewModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicModel.h"
#import "TracksModel.h"
#import "APIService.h"

@interface TopMusicsViewModel : NSObject

@property (strong, nonatomic) TracksModel *tracksModel;
@property (strong, nonatomic) NSMutableArray *musicArray;
@property (strong, nonatomic) APIService *service;

- (void) populateMusicsArray;
- (void) callTopMusics;
- (BOOL) processTopMusicCallback;
- (BOOL) logout;

@end
