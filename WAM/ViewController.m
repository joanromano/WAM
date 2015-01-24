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

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) TravelCardDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = @"";
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
    self.collectionView.alpha = 0.0;
    [self.dataSource shuffleDataSourceWithCompletion:^{
        [self.collectionView reloadData];
        self.titleLabel.text = @"Unsorted Boarding Cards";
        [UIView animateWithDuration:0.4 animations:^{
            self.collectionView.alpha = 1.0;
        }];
    }];
}

- (void)sortTrip
{
    [self.dataSource sortDataSourceWithCompletion:^(NSArray *previousIndexes, NSArray *currentIndexes) {
        [self.collectionView performBatchUpdates:^{
            [currentIndexes enumerateObjectsUsingBlock:^(NSNumber *currentIndex, NSUInteger idx, BOOL *stop) {
                [self.collectionView moveItemAtIndexPath:[NSIndexPath indexPathForItem:idx inSection:0]
                                             toIndexPath:[NSIndexPath indexPathForItem:currentIndex.integerValue inSection:0]];
            }];
        } completion:^(BOOL finished) {
            self.titleLabel.text = @"Sorted Trip";
        }];
    }];
}

@end
