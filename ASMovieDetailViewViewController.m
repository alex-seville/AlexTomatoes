//
//  ASMovieDetailViewViewController.m
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/17/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import "ASMovieDetailViewViewController.h"
#import "ASMovie.h"
#import "UIImageView+AFNetworking.h"

@interface ASMovieDetailViewViewController ()

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

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
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        movie = model;
        // Custom initialization
        self.title = movie.title;
        
        /* Set up the close button */
        UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeDetail)];
        self.navigationItem.rightBarButtonItem = closeButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}

- (void) viewWillAppear:(BOOL)animated {
    _movieTitleLabel.text = movie.title;
    _castLabel.text = movie.castString;
    [_posterView setImageWithURL:[NSURL URLWithString:movie.largePosterURl]];
    _summaryLabel.text = movie.synopsis;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - privat methods

- (void) closeDetail {
	[self.navigationController popViewControllerAnimated:YES];
}

@end
