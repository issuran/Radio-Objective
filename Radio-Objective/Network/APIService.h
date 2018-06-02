//
//  APIService.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 31/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <objc/runtime.h>
#import "Constants.h"

@interface APIService : NSObject

@property (retain, nonatomic) NSDictionary *dictResult;
@property (retain, nonatomic) AFHTTPSessionManager *manager;
@property (retain, nonatomic) NSString *baseUrl;

- (void) downloadTopSongs;
- (void) downloadTopArtists;

- (NSMutableDictionary *) getParametersToRequestTopMusics : (NSMutableDictionary *) params;
- (NSMutableDictionary *) getParametersToRequestTopArtists : (NSMutableDictionary *) params;

@end
