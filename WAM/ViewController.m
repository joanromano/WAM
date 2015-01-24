//
//  ViewController.m
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import "ViewController.h"

#import "TravelCardDataSource.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) TravelCardDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = [[TravelCardDataSource alloc] initWithCollectionView:self.collectionView];
}

#pragma mark - Actions

- (IBAction)newTripPressed
{
    [self newTrip];
}

- (IBAction)sortTripPressed
{
    [self sortTrip];
}

#pragma mark - Private

- (void)newTrip
{
    [self.dataSource shuffleDataSourceWithCompletion:^{
        [self.collectionView reloadData];
    }];
}

- (void)sortTrip
{
    [self.dataSource sortDataSourceWithCompletion:^{
        [self.collectionView reloadData];
    }];
}

@end
