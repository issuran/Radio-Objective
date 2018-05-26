//
//  ArtistModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "ArtistModel.h"

@implementation ArtistModel
@synthesize name, mbid, url;

-(void)initWithDictionary:(NSDictionary *)artistsDictionary{
    //self = [super init];
    if (self != nil) {
        self.name=[artistsDictionary objectForKey:@"name"];
        self.mbid=[artistsDictionary objectForKey:@"mbid"];
        self.url=[artistsDictionary objectForKey:@"url"];
    }
    //return self;
}
@end
