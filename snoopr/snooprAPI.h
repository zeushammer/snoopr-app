//
//  snooprAPI.h
//  snoopr
//
//  Created by Wong, Andrew (Contractor) on 9/3/14.
//  Copyright (c) 2014 iOSlearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface snooprAPI : NSObject

- (NSString*)makeRestAPICall:(NSString*)reqURLStr;

@end
