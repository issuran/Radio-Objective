//
//  APIService.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 31/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "APIService.h"

@implementation APIService
@synthesize dictResult;

- (instancetype) init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void) initialize {
    
    self.manager = [AFHTTPSessionManager manager];
    
    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    self.dictResult = nil;
    
    self.baseUrl = BASE_URL;
}

- (void) downloadTopSongs {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    
    // PARAMETERS
    params = [self getParametersToRequestTopMusics:(NSMutableDictionary *)params];
    
    // Top Songs request
    [self.manager GET:self.baseUrl parameters:params progress:nil
         success:^(NSURLSessionTask *task, id responseObject)
     {
         NSDictionary *result = (NSDictionary *) responseObject;
         
         self.dictResult = result;
         
         [[NSNotificationCenter defaultCenter] postNotificationName:@"downloadTopMusicsFromServer" object:nil];
     }
         failure:^(NSURLSessionTask *task, NSError *error)
     {
         NSLog(@"Error: %@", error.localizedFailureReason);
         
         [[NSNotificationCenter defaultCenter] postNotificationName:@"downloadTopMusicsFromServer" object:nil];
     }];
}

- (void) downloadTopArtists {
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    
    // PARAMETERS
    params = [self getParametersToRequestTopArtists:(NSMutableDictionary *)params];
    
    // Top Artists request
    [self.manager GET:self.baseUrl parameters:params progress:nil
              success:^(NSURLSessionTask *task, id responseObject)
     {
         NSDictionary *result = (NSDictionary *) responseObject;
         
         self.dictResult = result;
         
         [[NSNotificationCenter defaultCenter] postNotificationName:@"downloadTopArtistsFromServer" object:nil];
     }
              failure:^(NSURLSessionTask *task, NSError *error)
     {
         NSLog(@"Error: %@", error.localizedFailureReason);
         
         [[NSNotificationCenter defaultCenter] postNotificationName:@"downloadTopArtistsFromServer" object:nil];
     }];
}

- (NSMutableDictionary *) getParametersToRequestTopMusics : (NSMutableDictionary *) params{

    [params setObject:METHOD_TOP_TRACKS forKey:METHOD];
    [params setObject:API_KEY_VALUE forKey:API_KEY];
    [params setObject:FORMAT_VALUE forKey:FORMAT];
    
    return params;
}

- (NSMutableDictionary *) getParametersToRequestTopArtists : (NSMutableDictionary *) params{
    
    [params setObject:METHOD_TOP_ARTISTS forKey:METHOD];
    [params setObject:API_KEY_VALUE forKey:API_KEY];
    [params setObject:FORMAT_VALUE forKey:FORMAT];
    
    return params;
}

@end
