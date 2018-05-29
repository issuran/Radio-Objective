//
//  ArtistsModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 28/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "ArtistsModel.h"

@implementation ArtistsModel
@synthesize artistName, imageArray, image, imageDict, mbid;

-(id)initWithDictionary:(NSDictionary *)artistDictionary{
    
    if (self != nil) {
        
        self.artistName=[artistDictionary objectForKey:@"name"];
        
        self.mbid=[artistDictionary objectForKey:@"mbid"];
        
        self.image = [ImageModel new];
        self.imageArray = [artistDictionary objectForKey:@"image"];
        if(self.imageArray != nil){
            
            //0 - small, 1 - medium, 2 - large, 3 - extralarge, 4 - mega
            self.imageDict = (NSDictionary *) [self.imageArray objectAtIndex:3];
            
            if(self.imageDict != nil && self.imageArray.count > 0){
                [self.image initWithDictionary:self.imageDict];
            }
        }
    }
    
    return self;
}
@end
