//
//  TrackModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "TrackModel.h"

@implementation TrackModel
@synthesize music;

-(id) initWithDictionary:(NSDictionary *)trackDictionary{
    self = [super init];
    if (self != nil) {
        self.music=[trackDictionary valueForKey:@"track"];
    }
    return self;
}

@end
