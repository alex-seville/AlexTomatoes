//
//  ASMovieDetailViewViewController.h
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/17/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASMovie.h"

@interface ASMovieDetailViewViewController : UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil movieModel:(ASMovie *)movieModel;

@end
