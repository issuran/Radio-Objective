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
    
    _music = [[NSMutableArray alloc]init];
    _artist = [[NSMutableArray alloc]init];
    _image = [[NSMutableArray alloc]init];
    _musicArray = [[NSMutableArray alloc]init];
    
    NSString *baseUrl = @"http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&artist=cher&api_key=4335b079b4b2cc28a30a9395a8543f58&format=json";
    
    [params setObject:@"method" forKey:@"chart.gettoptracks"];
    [params setObject:@"4335b079b4b2cc28a30a9395a8543f58" forKey:@"api_key"];
    [params setObject:@"json" forKey:@"format"];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    
    [manager GET:baseUrl parameters:nil progress:nil
        success:^(NSURLSessionTask *task, id responseObject)
        {
            NSDictionary *result = (NSDictionary *) responseObject;
            
            TracksModel *tracksModel = [TracksModel new];
            self.tracksModel = [tracksModel initWithDictionary:result];
            
            [self populateMusicAndArtistsArray];
            
        }
        failure:^(NSURLSessionTask *task, NSError *error)
        {
            NSLog(@"Error: %@", error.localizedFailureReason);
        }];
    
    [self populateMusicAndArtistsArray];
}

- (void) populateMusicAndArtistsArray {
    
    if(self.tracksModel != nil){
        for (int i = 0; i < 20; i++) {
            NSDictionary *music = [self.tracksModel.listTracks objectAtIndex:i];
            
            MusicModel *musicModel = [MusicModel new];
            
            musicModel = [musicModel initWithDictionary:music];
            
            [self.musicArray addObject:musicModel];
            
            [self.music addObject:musicModel.trackName];
            [self.artist addObject:musicModel.artist.name];            
            [self.image addObject:musicModel.image.text];
            
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateFromServer" object:nil];
        
    }
}

@end
