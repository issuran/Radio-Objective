//
//  APIService.h
//  Radio-Objective
//
//  Created by Tiago Oliveira on 20/05/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject

- (NSObject *) retrieveMusic : (NSString *)username forPassword:(NSString *)password;

@end
