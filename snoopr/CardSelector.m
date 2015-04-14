//
//  CardSelector.m
//  snoopr
//
//  Created by Wong, Andrew (Contractor) on 8/27/14.
//  Copyright (c) 2014 iOSlearning. All rights reserved.
//

#import "CardSelector.h"

@interface CardSelector()

@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readwrite, strong) Card *currentCard;
@property (nonatomic, readwrite, strong) Card *nextCard;

@end


@implementation CardSelector

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

// a different init is used, override this
- (instancetype)init
{
    return nil;
}

// our init
- (instancetype)initWithCardCount:(NSUInteger)count
{
    self = [super init]; // call NSObject initializer
    
    // verify parent init...
    if (self) {
        // call API to load initial cards
        
        for (int i = 0; i < count; i++) {
            Card *card = [[Card alloc] init];
            card.contents = [NSString stringWithFormat:@"blank card %d", i];
            [self.cards addObject:card];
        }
    }
    
    // grab first two cards from container
    self.currentCard = [self getNextCard];
    self.nextCard = [self getNextCard];
    
    return self;
}

- (void)selectNextCard
{
    self.currentCard = self.nextCard;
    self.nextCard = [self getNextCard];
}

// private

// grabs next card at index 0, removes from array
// add checks for nil when calling this
- (Card *)getNextCard
{
    Card *nextCard = nil;
    
    if ([self.cards count]) {
        nextCard = self.cards[0];
        [self.cards removeObjectAtIndex:0];
    }
    
    return nextCard;
}

@end