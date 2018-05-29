//
//  ArtistsListModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 28/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistsListModel : NSObject
{
    NSArray *artistArray;
    NSDictionary *artistsDic;
    NSArray *listArtists;
}
@property (retain, nonatomic) NSArray *artistArray;
@property (retain, nonatomic) NSDictionary *artistsDic;
@property (retain, nonatomic) NSArray *listArtists;

-(id) initWithDictionary:(NSDictionary *)artistDictionary;
@end
