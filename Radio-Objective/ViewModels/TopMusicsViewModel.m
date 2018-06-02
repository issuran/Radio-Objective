//
//  TopMusicsViewModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "TopMusicsViewModel.h"
@import Firebase;

@implementation TopMusicsViewModel

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
    
    // REQUEST TO POPULATE MUSICS
    [self callTopMusics];
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

- (BOOL) logout{
    
    NSError *signOutError;
    
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if(!status){
        NSLog(@"Error signing out : %@", signOutError);
        return false;
    }
    return true;
}


@end
