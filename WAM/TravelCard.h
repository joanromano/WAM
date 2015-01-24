//
//  TravelCard.h
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TravelCard : NSObject

@property (nonatomic, copy, readonly) NSString *origin, *destination, *seatAssignment, *transportation;

- (instancetype)initWithOrigin:(NSString *)origin destination:(NSString *)destination transportation:(NSString *)transportation seat:(NSString *)seatAssignment;

@end
