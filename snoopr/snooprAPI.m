//
//  snooprAPI.m
//  snoopr
//
//  Created by Wong, Andrew (Contractor) on 9/3/14.
//  Copyright (c) 2014 iOSlearning. All rights reserved.
//

#import "snooprAPI.h"

@implementation snooprAPI

// below copied here from snooprViewController...

//NSMutableData *_responseData;

/*
 - (IBAction)likebuttonclick:(id)sender
 {
 NSString *twitterUrl = @"http://localhost:8080/nextshow";
 NSString *resp = [self makeRestAPICall:twitterUrl];
 self.label.text = [NSString stringWithFormat:@"Response: %@", resp];
 }
 */

- (NSString*)makeRestAPICall:(NSString*)reqURLStr
{
    NSURLRequest *Request = [NSURLRequest requestWithURL:[NSURL URLWithString:reqURLStr]];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:Request returningResponse:&resp error:&error];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"%@", responseString);
    return responseString;
}

@end
