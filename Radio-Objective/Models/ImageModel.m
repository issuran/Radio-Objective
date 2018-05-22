//
//  ImageModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize text, size;

-(id)initWithDictionary:(NSDictionary *)imagesDictionary{
    self = [super init];
    if (self != nil) {
        self.text=[imagesDictionary valueForKey:@"#text"];
        self.size=[imagesDictionary valueForKey:@"size"];
    }
    return self;
}

@end
