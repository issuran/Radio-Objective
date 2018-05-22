//
//  TracksModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackModel.h"

@interface TracksModel : NSObject
{
    TrackModel *track;
}
@property (retain, nonatomic) TrackModel *track;

-(id) initWithDictionary:(NSDictionary *)trackDictionary;
@end
