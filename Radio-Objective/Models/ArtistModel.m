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

-(id)initWithDictionary:(NSDictionary *)artistsDictionary{
    self = [super init];
    if (self != nil) {
        self.name=[artistsDictionary valueForKey:@"name"];
        self.mbid=[artistsDictionary valueForKey:@"mbid"];
        self.url=[artistsDictionary valueForKey:@"url"];
    }
    return self;
}
@end
