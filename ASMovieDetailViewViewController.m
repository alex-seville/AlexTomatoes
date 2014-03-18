//
//  ASMovieDetailViewViewController.m
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/17/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import "ASMovieDetailViewViewController.h"
#import "ASMovie.h"

@interface ASMovieDetailViewViewController ()

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@property ASMovie *movieModel;

@end

@implementation ASMovieDetailViewViewController {
    ASMovie *movie;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil movieModel:(ASMovie *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        movie = _movieModel;
        // Custom initialization
        self.title = movie.title;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _movieTitleLabel.text = movie.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
