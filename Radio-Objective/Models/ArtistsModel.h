//
//  ArtistsModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 28/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageModel.h"
#import "ArtistModel.h"

@interface ArtistsModel : NSObject{
    @public NSString *artistName;
    @public NSString *mbid;
    @public ImageModel *image;
    
    @private NSDictionary *imageDict;
    @private NSArray *imageArray;
}

@property (retain, nonatomic) NSString *artistName;
@property (retain, nonatomic) NSString *mbid;
@property (retain, nonatomic) ImageModel *image;
@property (retain, nonatomic) NSDictionary *imageDict;
@property (retain, nonatomic) NSArray *imageArray;

-(id) initWithDictionary:(NSDictionary *)artistDictionary;

@end
