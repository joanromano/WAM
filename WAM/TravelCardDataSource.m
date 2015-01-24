//
//  TravelCardDataSource.m
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import "TravelCardDataSource.h"

#import "TravelCard.h"
#import "NSArray+TravelCardAdditions.h"
#import "TravelCardCollectionViewCell.h"

static NSString *const TCDSCellIdentifier = @"CellIdentifier";

@interface TravelCardDataSource () <UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *cards;

@end

@implementation TravelCardDataSource

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    if (self = [super init])
    {
        _cards = [[TravelCard randomTravelCardStackWithNumber:10] shuffle];
        _collectionView = collectionView;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(TravelCardCollectionViewCell.class) bundle:nil] forCellWithReuseIdentifier:TCDSCellIdentifier];
    }
    
    return self;
}

#pragma mark - UICollectionView data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TravelCard *card = self.cards[indexPath.item];
    TravelCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TCDSCellIdentifier forIndexPath:indexPath];
    cell.cardText = [NSString stringWithFormat:@"%@ - %@", card.origin, card.destination];
    cell.transportText = card.transportation;
    cell.seatText = card.seatAssignment;
    cell.shouldShowSeparator = indexPath.item != self.cards.count - 1;
    
    return cell;
}

#pragma mark - Public

- (void)shuffleDataSourceWithCompletion:(void(^)(void))completion
{
    self.cards = [[TravelCard randomTravelCardStackWithNumber:10] shuffle];
    
    if (completion)
    {
        completion();
    }
}

@end
