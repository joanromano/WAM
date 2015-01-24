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

+ (NSArray *)randomTravelCardStackWithNumber:(NSInteger)number
{
    NSString *city,
             *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSInteger numberOfCards = number;
    NSArray *transports = [self meansOfTransportation];
    NSMutableArray *cities = [[self cities] mutableCopy],
                   *origins = [NSMutableArray array],
                   *destinations = [NSMutableArray array],
                   *cards = [NSMutableArray array];
    
    for (NSInteger i = 0; i < numberOfCards; i++)
    {
        city = [cities objectAtIndex:arc4random() % cities.count];
        [origins addObject:city];
        [cities removeObject:city];
        
        if (i > 0)
        {
            [destinations addObject:city];
        }
    }
    
    city = [cities objectAtIndex:arc4random() % cities.count];
    [destinations addObject:city];
    
    for (NSInteger i = 0; i < numberOfCards; i++)
    {
        [cards addObject:[[TravelCard alloc] initWithOrigin:origins[i]
                                                destination:destinations[i]
                                             transportation:transports[arc4random() % transports.count]
                                                       seat:[NSString stringWithFormat:@"%@%@",
                                                             @(arc4random() % 100),
                                                             [letters substringWithRange:NSMakeRange(arc4random() % letters.length, 1)]]]];
    }
    
    return cards;
}

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

- (BOOL)isEqual:(TravelCard *)card
{
    return [self.origin isEqualToString:card.origin] && [self.destination isEqualToString:card.destination];
}

+ (NSArray *)meansOfTransportation
{
    return
    @[@"Car",
      @"Plane",
      @"Train",
      @"Bus"
      ];
}

+ (NSArray *)cities
{
    return
    @[@"Pyongyang",
      @"Kinshasa",
      @"Beijing",
      @"Seoul",
      @"Lagos",
      @"Alexandria",
      @"London",
      @"Chennai",
      @"Shenyang",
      @"Ankara",
      @"Hong Kong",
      @"Abidjan",
      @"Busan",
      @"Santiago",
      @"Tokyo",
      @"Rio de Janeiro",
      @"Riyadh",
      @"Yokohama",
      @"Japan",
      @"Delhi",
      @"Durban",
      @"Los Angeles",
      @"Yangon",
      @"Jakarta",
      @"Bogota",
      @"Kolkata",
      @"New York City",
      @"Hyderabad",
      @"Mexico City",
      @"Bangalore",
      @"Shenzhen",
      @"Guangzhou",
      @"Casablanca",
      @"Moscow",
      @"Singapore",
      @"Saint Petersburg",
      @"Nairobi",
      @"Bangkok",
      @"Mumbai",
      @"Hanoi",
      @"Berlin",
      @"New Taipei City",
      @"Madrid",
      @"Addis Ababa",
      @"Baghdad",
      @"Tianjin",
      @"Cape Town",
      @"Jeddah",
      @"Ho Chi Minh City",
      @"Sao Paulo",
      @"Shanghai",
      ];
}

@end
