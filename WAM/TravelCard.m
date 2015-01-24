//
//  TravelCard.m
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import "TravelCard.h"

@interface TravelCard ()

@property (nonatomic, copy) NSString *origin, *destination, *seatAssignment, *transportation;

@end

@implementation TravelCard

- (instancetype)initWithOrigin:(NSString *)origin destination:(NSString *)destination transportation:(NSString *)transportation seat:(NSString *)seatAssignment
{
    if (self = [super init])
    {
        _origin = origin;
        _destination = destination;
        _transportation = transportation;
        _seatAssignment = seatAssignment;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Card with origin: %@, destination: %@, transportation: %@, seat: %@", self.origin, self.destination, self.transportation, self.seatAssignment];
}

@end
