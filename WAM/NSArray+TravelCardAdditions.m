//
//  NSArray+TravelCardAdditions.m
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import "NSArray+TravelCardAdditions.h"

@implementation NSArray (TravelCardAdditions)

- (NSArray *)shuffle
{
    NSMutableArray *mArray = [self mutableCopy];
    NSUInteger count = mArray.count;
    for (uint i = 0; i < count; ++i)
    {
        int n = arc4random_uniform((int)count - i) + i;
        [mArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    return [mArray copy];
}

@end
