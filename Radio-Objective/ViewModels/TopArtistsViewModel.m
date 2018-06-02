//
//  TopArtistsViewModel.m
//  Radio-Objective
//
//  Created by Tiago Oliveira on 02/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

#import "TopArtistsViewModel.h"
@import Firebase;

@implementation TopArtistsViewModel

- (instancetype) init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

// As Views holds reference to the ViewModel, so makes sense initialize our View, given a ViewModel
- (void) initialize {
    
    self.service = [[APIService alloc]init];
    
    _artistArray = [[NSMutableArray alloc]init];
    
    // REQUEST TO POPULATE ARTISTS
    [self callTopArtists];

}

- (void) populateArtistsArray {
    
    if(self.artistsListModel != nil){
        for (int i = 0; i < 20; i++) {
            NSDictionary *artist = [self.artistsListModel.listArtists objectAtIndex:i];
            
            ArtistsModel *artistsModel = [ArtistsModel new];
            
            artistsModel = [artistsModel initWithDictionary:artist];
            
            [self.artistArray addObject:artistsModel];
            
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateArtistsFromServer" object:nil];
        
    }
}

- (void) callTopArtists{
    
    [self.service downloadTopArtists];
    
}

- (BOOL) processTopArtistsCallback{
    
    NSDictionary *result = (NSDictionary *) [self.service dictResult];
    
    if(result == nil){
        return NO;
    }
    
    ArtistsListModel *artistsListModel = [ArtistsListModel new];
    self.artistsListModel = [artistsListModel initWithDictionary:result];
    
    return YES;
}

- (BOOL) logout{
    
    NSError *signOutError;
    
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if(!status){
        NSLog(@"Error signing out : %@", signOutError);
        return false;
    }
    return true;
}

@end
