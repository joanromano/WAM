//
//  TravelCardDataSource.h
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TravelCardDataSource : NSObject

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

- (void)shuffleDataSourceWithCompletion:(void(^)(void))completion;

@end
