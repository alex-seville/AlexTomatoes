//
//  ASAPIService.h
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/18/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASAPIService : NSObject
+ (void)getMovies:(NSString*)type withSuccess:(void (^)(NSMutableArray *movies))onSuccess andFailure:(void (^)(void))onFailure;
@end
