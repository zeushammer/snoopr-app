//
//  CardSelector.h
//  snoopr
//
//  Created by Wong, Andrew (Contractor) on 8/27/14.
//  Copyright (c) 2014 iOSlearning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardSelector : NSObject

@property (nonatomic, readonly, strong) Card *currentCard;
@property (nonatomic, readonly, strong) Card *nextCard;

- (instancetype)initWithCardCount:(NSUInteger)count;
- (void)selectNextCard;

@end
