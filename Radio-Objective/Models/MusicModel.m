//
//  MusicModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicModel.h"

@implementation MusicModel
@synthesize artist, image, trackName;

-(id)initWithDictionary:(NSDictionary *)musicDictionary{
    self = [super init];
    if (self != nil) {
        self.artist=[musicDictionary valueForKey:@"artist"];
        self.image=[musicDictionary valueForKey:@"image"];
        self.trackName=[musicDictionary valueForKey:@"name"];
    }
    return self;
}
@end
