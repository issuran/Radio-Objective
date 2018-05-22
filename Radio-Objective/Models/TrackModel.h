//
//  TrackModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicModel.h"

@interface TrackModel : NSObject
{
    NSArray <MusicModel *> *music;
}
@property (retain, nonatomic) NSArray <MusicModel *> *music;

-(id) initWithDictionary:(NSDictionary *)trackDictionary;
@end
