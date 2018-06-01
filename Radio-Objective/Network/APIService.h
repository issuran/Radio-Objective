//
//  APIService.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 31/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject

- (BOOL) downloadTopSongs : (NSString *)username forPassword:(NSString *)password;
- (BOOL) downloadTopArtists : (NSString *)username forPassword:(NSString *)password;

@end
