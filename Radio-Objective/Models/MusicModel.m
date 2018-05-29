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
@synthesize artist, image, trackName, artistDict, imageArray, imageDict;

-(id)initWithDictionary:(NSDictionary *)musicDictionary{
    self = [super init];
    if (self != nil) {
        
        self.trackName=[musicDictionary objectForKey:@"name"];
        
        self.artist = [ArtistModel new];
        
        self.artistDict = [musicDictionary objectForKey:@"artist"];
        if(self.artistDict != nil){
            //self.artist.name = [self.artistDict objectForKey:@"name"];
            [self.artist initWithDictionary:self.artistDict];
        }
        
        self.image = [ImageModel new];
        self.imageArray = [musicDictionary objectForKey:@"image"];
        if(self.imageArray != nil){
            
            //0 - small, 1 - medium, 2 - large, 3 - extralarge, 4 - mega
            self.imageDict = (NSDictionary *) [self.imageArray objectAtIndex:0];
            
            if(self.imageDict != nil && self.imageArray.count > 0){
                [self.image initWithDictionary:self.imageDict];
            }
        }
    }
    return self;
}
@end
