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
    
    NSString *baseUrl = @"http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&artist=cher&api_key=4335b079b4b2cc28a30a9395a8543f58&format=json";
    
    [params setObject:@"method" forKey:@"chart.gettoptracks"];
    [params setObject:@"4335b079b4b2cc28a30a9395a8543f58" forKey:@"api_key"];
    [params setObject:@"json" forKey:@"format"];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    
    [manager GET:baseUrl parameters:nil progress:nil
        success:^(NSURLSessionTask *task, id responseObject)
        {
            TracksModel *tracksModel = [TracksModel new];
            tracksModel = [tracksModel initWithDictionary:responseObject];
            NSLog(@"result: %@", tracksModel.track);
            NSLog(@"result");
            
            NSDictionary *result = (NSDictionary *) responseObject;
            NSArray *tracks = [result objectForKey:@"tracks"];
            
            NSDictionary *track = (NSDictionary *) tracks;
            
            NSArray *listTracks = [track objectForKey:@"track"];
            
            NSObject *music = [listTracks objectAtIndex:0];
            
            MusicModel *musicModel = [MusicModel new];
            
            musicModel.trackName = [music valueForKey:@"name"];
            musicModel.image = [music valueForKey:@"image"];
            musicModel.artist = [music valueForKey:@"artist"];
        }
        failure:^(NSURLSessionTask *task, NSError *error)
        {
            NSLog(@"Error: %@", error.localizedFailureReason);
        }];
    
    self.music =  @[@"Starboy", @"One Kiss", @"Habits", @"The Less I Know The Better"];
    self.artist =  @[@"The Weeknd", @"Dua Lipa", @"Tove Lo", @"Tame Impala"];
}

@end
