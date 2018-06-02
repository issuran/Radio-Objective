//
//  MainScreenViewModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "MainScreenViewModel.h"
#import <AFNetworking.h>
#import <objc/runtime.h>
#import "TracksModel.h"
#import "MusicModel.h"
#import "ArtistsListModel.h"
#import "ArtistsModel.h"
@import Firebase;

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
    
    self.service = [[APIService alloc]init];
    
    _musicArray = [[NSMutableArray alloc]init];
    _artistArray = [[NSMutableArray alloc]init];
    
    // REQUEST TO POPULATE MUSICS
    [self callTopMusics];
    
    // REQUEST TO POPULATE ARTISTS
    [self callTopArtists];
}

- (void) populateMusicsArray {
    
    if(self.tracksModel != nil){
        for (int i = 0; i < 20; i++) {
            NSDictionary *music = [self.tracksModel.listTracks objectAtIndex:i];
            
            MusicModel *musicModel = [MusicModel new];
            
            musicModel = [musicModel initWithDictionary:music];
            
            [self.musicArray addObject:musicModel];
            
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateFromServer" object:nil];
        
    }
}

- (void) populateArtistsArray {
    
    if(self.artistsListModel != nil){
        for (int i = 0; i < 20; i++) {
            NSDictionary *artist = [self.artistsListModel.listArtists objectAtIndex:i];
            
            ArtistsModel *artistsModel = [ArtistsModel new];
            
            artistsModel = [artistsModel initWithDictionary:artist];
            
            [self.artistArray addObject:artistsModel];
            
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateArtistsFromServer" object:nil];
        
    }
}

- (BOOL) logout{
    
    NSError *signOutError;
    
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if(!status){
        NSLog(@"Error signing out : %@", signOutError);
        return false;
    }
    return true;
}

- (void) callTopMusics{
    
    [self.service downloadTopSongs];
    
}

- (BOOL) processTopMusicCallback{
    
    NSDictionary *result = (NSDictionary *) [self.service dictResult];
    
    if(result == nil){
        return NO;
    }
    
    TracksModel *tracksModel = [TracksModel new];
    self.tracksModel = [tracksModel initWithDictionary:result];
    
    return YES;
}

- (void) callTopArtists{
    
    [self.service downloadTopArtists];
    
}

- (BOOL) processTopArtistsCallback{
    
    NSDictionary *result = (NSDictionary *) [self.service dictResult];
    
    if(result == nil){
        return NO;
    }
    
    ArtistsListModel *artistsListModel = [ArtistsListModel new];
    self.artistsListModel = [artistsListModel initWithDictionary:result];
    
    return YES;
}

@end
