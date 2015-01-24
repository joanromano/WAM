//
//  NSArray+TravelCardAdditions.m
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import "NSArray+TravelCardAdditions.h"

#import "TravelCard.h"

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

- (NSArray *)sort
{
    TravelCard *card;
    NSString *origin, *destination;
    NSMutableArray *resultArray = [NSMutableArray array];
    NSMutableDictionary *originDictionary = [NSMutableDictionary dictionary],
                        *destinationDictionary = [NSMutableDictionary dictionary];
    
    // Create origin/destination hash tables
    [self enumerateObjectsUsingBlock:^(TravelCard *card, NSUInteger idx, BOOL *stop) {
        originDictionary[card.origin] = card.destination;
        destinationDictionary[card.destination] = card.origin;
    }];
    
    card = self[arc4random() % self.count];
    origin = card.origin;
    destination = originDictionary[origin];
    
    // Choose random card and add cards until there's no destination
    while (destination)
    {
        [resultArray addObject:[self cardWithOrigin:origin]];
        origin = destination;
        destination = originDictionary[origin];
    }
    
    destination = [resultArray.firstObject origin];
    origin = destinationDictionary[destination];
    
    // Add missing origins
    while (origin)
    {
        [resultArray insertObject:[self cardWithOrigin:origin] atIndex:0];
        destination = origin;
        origin = destinationDictionary[origin];
    }
    
    return [resultArray copy];
}

#pragma mark - Private

- (TravelCard *)cardWithOrigin:(NSString *)origin
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"origin == %@", origin]].firstObject;
}

@end
