//
//  ArtistsListModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 28/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "ArtistsListModel.h"

@implementation ArtistsListModel
@synthesize artistsDic, artistArray, listArtists;

-(id) initWithDictionary:(NSDictionary *)artistDictionary{
    self = [super init];
    if (self != nil) {
        self.artistArray = [artistDictionary objectForKey:@"artists"];
        if(self.artistArray != nil){
            self.artistsDic = (NSDictionary *) self.artistArray;
            if(self.artistsDic != nil && self.artistArray.count > 0){
                self.listArtists = [self.artistsDic objectForKey:@"artist"];
            }
        }
    }
    return self;
}
@end
