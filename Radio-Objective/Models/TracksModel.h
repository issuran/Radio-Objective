//
//  TracksModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TracksModel : NSObject
{
    NSArray *track;
    NSDictionary *tracksDic;
    NSArray *listTracks;
}
@property (retain, nonatomic) NSArray *trackArray;
@property (retain, nonatomic) NSDictionary *tracksDic;
@property (retain, nonatomic) NSArray *listTracks;

-(id) initWithDictionary:(NSDictionary *)trackDictionary;
@end
