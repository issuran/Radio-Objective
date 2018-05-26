//
//  MusicModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageModel.h"
#import "ArtistModel.h"

@interface MusicModel : NSObject
{
    @public NSString *trackName;
    @public ImageModel *image;
    @public ArtistModel *artist;
    
    @private NSDictionary *artistDict;
    @private NSDictionary *imageDict;
    @private NSArray *imageArray;
}

@property (retain, nonatomic) NSString *trackName;
@property (retain, nonatomic) ImageModel *image;
@property (retain, nonatomic) ArtistModel *artist;
@property (retain, nonatomic) NSDictionary *artistDict;
@property (retain, nonatomic) NSDictionary *imageDict;
@property (retain, nonatomic) NSArray *imageArray;

-(id) initWithDictionary:(NSDictionary *)musicDictionary;
@end
