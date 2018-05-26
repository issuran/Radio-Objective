//
//  TracksModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "TracksModel.h"

@implementation TracksModel
@synthesize trackArray, tracksDic, listTracks;

-(id) initWithDictionary:(NSDictionary *)trackDictionary{
    self = [super init];
    if (self != nil) {
        self.trackArray = [trackDictionary objectForKey:@"tracks"];
        if(self.trackArray != nil){
            self.tracksDic = (NSDictionary *) self.trackArray;
            if(self.tracksDic != nil && self.trackArray.count > 0){
                self.listTracks = [self.tracksDic objectForKey:@"track"];
            }
        }
    }
    return self;
}

@end
