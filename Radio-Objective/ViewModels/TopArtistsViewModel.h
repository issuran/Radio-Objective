//
//  TopArtistsViewModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 02/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArtistsListModel.h"
#import "ArtistsModel.h"
#import "APIService.h"

@interface TopArtistsViewModel : NSObject

@property (strong, nonatomic) NSMutableArray *artistArray;
@property (strong, nonatomic) ArtistsListModel *artistsListModel;
@property (strong, nonatomic) APIService *service;

- (void) populateArtistsArray;
- (void) callTopArtists;
- (BOOL) processTopArtistsCallback;
- (BOOL) logout;

@end
