//
//  ASMovieListViewController.m
//  RottenTomatoes
//
//  Created by Alexander Seville on 3/14/14.
//  Copyright (c) 2014 Alexander Seville. All rights reserved.
//

#import "ASMovieListViewController.h"
#import "ASMovieCell.h"
#import "ASMovie.h"
#import "ASMovieDetailViewViewController.h"
#import "ASAPIService.h"
#import "SVProgressHUD.h"
#import "TSMessage.h"



@interface ASMovieListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *movieTable;
@property (nonatomic, strong) NSMutableArray *movies;


- (void)loadData;

@end

@implementation ASMovieListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil movieDataType:(NSString *)moveDataType
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* setup nav stuff */
    UIBarButtonItem *backToList = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStylePlain target:nil action:nil];
	self.navigationItem.backBarButtonItem = backToList;
    
    [self loadData];
    
    /* Set a height for our rows */
    self.movieTable.rowHeight = 115;
    
    /* allow refresh on swipe down */
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.movieTable addSubview:refreshControl];
    
    /* set the data source for the table */
    self.movieTable.dataSource = self;
    self.movieTable.delegate = self;
    
    /* we need this for our custom cell*/
    UINib *movieCellNib = [UINib nibWithNibName:@"ASMovieCell" bundle:nil];
    [self.movieTable registerNib:movieCellNib forCellReuseIdentifier:@"ASMovieCell"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ASMovieCell" forIndexPath:indexPath];
    /* add the control to indicate more details can be seen */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    /* we just return the cell, and let the cell handle how it's displayed */
    cell.movie = self.movies[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /* push the detail view */
    ASMovieDetailViewViewController *vc = [[ASMovieDetailViewViewController alloc] initWithNibName:@"ASMovieDetailViewViewController" bundle:nil movieModel:[self.movies objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:vc animated:YES];
    
}



#pragma mark - private

- (void)loadData
{
    
    [SVProgressHUD show];
    [ASAPIService getMovies:self.movieDataType withSuccess:^(NSMutableArray *movies) {
        
        self.movies = movies;
        [self.movieTable reloadData];
        [SVProgressHUD dismiss];
    } andFailure:^(void) {
        [TSMessage showNotificationWithTitle:@"Network Error" subtitle:@"Network unavailable, please try again." type:TSMessageNotificationTypeError];
        [SVProgressHUD dismiss];
        
    }];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self loadData];
    [refreshControl endRefreshing];
}


@end
