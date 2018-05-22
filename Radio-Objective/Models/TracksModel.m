//
//  TracksModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "TracksModel.h"

@implementation TracksModel
@synthesize track;

-(id) initWithDictionary:(NSDictionary *)trackDictionary{
    self = [super init];
    if (self != nil) {
        self.track=[trackDictionary valueForKey:@"tracks"];
    }
    return self;
}

@end
