//
//  ASMovieCell.m
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/17/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import "ASMovieCell.h"
#import "ASMovie.h"
#import "UIImageView+AFNetworking.h"
#import "ASMovieDetailViewViewController.h"

@interface ASMovieCell()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;


@end

@implementation ASMovieCell

- (void)awakeFromNib
{
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public methods


- (void)setMovie:(ASMovie *)movie {
    /* take a movie in, and decorate the cell accordingly */
    _movie = movie;
    self.movieTitleLabel.text = movie.title;
    [self.posterView setImageWithURL:[NSURL URLWithString:movie.posterURl]];
    self.movieSynopsisLabel.text = movie.synopsis;
    self.castLabel.text = movie.castString;
}

@end
