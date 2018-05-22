//
//  ArtistModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistModel : NSObject
{
    NSString *name;
    NSString *mbid;
    NSString *url;
}
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *mbid;
@property (retain, nonatomic) NSString *url;

-(id) initWithDictionary:(NSDictionary *)artistsDictionary;
@end
