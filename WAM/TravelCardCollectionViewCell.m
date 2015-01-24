//
//  TravelCardCollectionViewCell.m
//  WAM
//
//  Created by Joan Romano on 1/24/15.
//  Copyright (c) 2015 Romano. All rights reserved.
//

#import "TravelCardCollectionViewCell.h"

@interface TravelCardCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *cardTitleLabel;
@property (nonatomic, weak) IBOutlet UIView *separatorView;

@end

@implementation TravelCardCollectionViewCell

- (void)prepareForReuse
{
    self.cardTitleLabel.text = @"";
    self.separatorView.hidden = YES;
}

- (void)setCardText:(NSString *)cardText
{
    _cardText = [cardText copy];
    
    self.cardTitleLabel.text = _cardText;
}

- (void)setShouldShowSeparator:(BOOL)shouldShowSeparator
{
    _shouldShowSeparator = shouldShowSeparator;
    
    self.separatorView.hidden = !shouldShowSeparator;
}

@end
