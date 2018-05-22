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
    NSString *trackName;
    ImageModel *image;
    ArtistModel *artist;
}
@property (retain, nonatomic) NSString *trackName;
@property (retain, nonatomic) ImageModel *image;
@property (retain, nonatomic) ArtistModel *artist;

-(id) initWithDictionary:(NSDictionary *)musicDictionary;
@end
