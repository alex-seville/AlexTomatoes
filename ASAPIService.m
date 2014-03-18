//
//  ASAPIService.m
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/18/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import "ASAPIService.h"
#import "ASMovie.h"

static NSString *dvdApi = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=";
static NSString *boxOfficeApi = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=";
static NSString *apiKey = @"nkgx8re96pat5a38hfkub8jc";


@implementation ASAPIService

+ (void)getMovies:(NSString*)type withSuccess:(void (^)(NSMutableArray *movies))onSuccess andFailure:(void (^)(void))onFailure {
    
    NSString *url = @"";
    
    if ([type isEqual: @"DVD"]){
        url = [dvdApi stringByAppendingString:apiKey];
    }else if ([type isEqualToString:@"BoxOffice"]){
        url = [boxOfficeApi stringByAppendingString:apiKey];
    }
        
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        if (connectionError){
            return onFailure();
        }
        
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        /* TODO throw parse errors */
        
        
        NSMutableArray *parsedMovies = [[NSMutableArray alloc] init];
        
        /* loop through the data and make models */
        for (NSDictionary *movie in object[@"movies"]){
            ASMovie *parsedMovie = [[ASMovie alloc] init];
            parsedMovie.title = [movie objectForKey:@"title"];
            parsedMovie.posterURl = [[movie objectForKey:@"posters"] objectForKey:@"thumbnail"];
            parsedMovie.synopsis = [movie objectForKey:@"synopsis"];
            [parsedMovies addObject:parsedMovie];
        }
            
        
        
        onSuccess(parsedMovies);
        
    }];
}

@end
