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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    
    _musicArray = [[NSMutableArray alloc]init];
    _artistArray = [[NSMutableArray alloc]init];
    
    NSString *baseUrl = BASE_URL;
    
    // Get top songs
    [params setObject:METHOD_TOP_TRACKS forKey:METHOD];
    
    [params setObject:API_KEY_VALUE forKey:API_KEY];
    [params setObject:FORMAT_VALUE forKey:FORMAT];
    
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    // Top Songs request
    [manager GET:baseUrl parameters:params progress:nil
        success:^(NSURLSessionTask *task, id responseObject)
        {
            NSDictionary *result = (NSDictionary *) responseObject;
            
            TracksModel *tracksModel = [TracksModel new];
            self.tracksModel = [tracksModel initWithDictionary:result];
            
            [self populateMusicsArray];
            
        }
        failure:^(NSURLSessionTask *task, NSError *error)
        {
            NSLog(@"Error: %@", error.localizedFailureReason);
        }];
    
    // Top artists request
    
    
    // Get top artists
    [params setObject:METHOD_TOP_ARTISTS forKey:METHOD];

    [manager GET:baseUrl parameters:params progress:nil
         success:^(NSURLSessionTask *task, id responseObject)
     {
         NSDictionary *result = (NSDictionary *) responseObject;
         
         ArtistsListModel *artistsListModel = [ArtistsListModel new];
         self.artistsListModel = [artistsListModel initWithDictionary:result];
         
         [self populateArtistsArray];
         
     }
         failure:^(NSURLSessionTask *task, NSError *error)
     {
         NSLog(@"Error: %@", error.localizedFailureReason);
     }];
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

@end
