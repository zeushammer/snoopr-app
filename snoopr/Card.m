//
//  Card.m
//  snoopr
//
//  Created by Wong, Andrew (Contractor) on 8/27/14.
//  Copyright (c) 2014 iOSlearning. All rights reserved.
//

#import "Card.h"

@interface Card()
// private interface
@end

@implementation Card

- (NSString *)contents
{
    return _contents ? _contents : @"blank";
}

@end
