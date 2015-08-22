//
//  GoogleImageFetchCommand.m
//  TimesAssignment
//
//  Created by Saalis Umer on 29/07/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import "NewsFeedCommand.h"
#import "Constants.h"
#import "ApplicationModel.h"
#import "NewsFeedBuilder.h"
#import "ApplicationModel.h"

@implementation NewsFeedCommand

-(NSString *)commandType
{
    return kCommandTypeNewsFeed;
}

#pragma mark - Command Implementation
- (void)main {
        ApplicationModel * mApplicationModel = [ApplicationModel instance];
    
    if (self.nextPage == NO) {
        [mApplicationModel clearModel];
    }
    
    NSURL *url = [[NSURL alloc] initWithString:kURLTypeNewsFeed];

    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    urlRequest.HTTPMethod = @"GET";

    mURLConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES];
}

#pragma mark - NSURLConnectionDataDelegate implementation
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError* error;

    
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:mResponseData options:NSJSONReadingMutableContainers error:&error];
    
    if(error == nil) {
        if([responseObject valueForKey:@"NewsItem"] != nil) {
            id value = [responseObject valueForKey:@"NewsItem"];
            [applicationModel addFeedsToModel:value];
        }
        [super notifyDidReceiveResponseOnMainThread:applicationModel.newsFeeds];
    } else {
        [super notifyDidFailWithErrorOnMainThread:error];
    }
}

@end
