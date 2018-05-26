//
//  ImageModel.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
{
    NSString *text;
    NSString *size;
}
@property (retain, nonatomic) NSString *text;
@property (retain, nonatomic) NSString *size;

-(void) initWithDictionary:(NSDictionary *)imagesDictionary;
@end
