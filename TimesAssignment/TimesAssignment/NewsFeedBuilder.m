//
//  GoogleImageBuilder.m
//  TimesAssignment
//
//  Created by Saalis Umer on 29/07/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import "NewsFeedBuilder.h"
#import "NewsFeed.h"
#import "NSDate+HS18.h"
@implementation NewsFeedBuilder

+ (NewsFeed*)newsFeedObjectFromJSON:(id)newsFeedJSON
{
        NewsFeed * newsFeed = [[NewsFeed alloc]init];
        
        id value = [newsFeedJSON valueForKey:@"NewsItemId"];
        if(value != nil && value != [NSNull null]) {
                newsFeed.newsItemId = value;
        }
        
        value = [newsFeedJSON valueForKey:@"HeadLine"];
        if(value != nil && value != [NSNull null]) {
                newsFeed.newsHeadLine = value;
        }
    
        value = [newsFeedJSON valueForKey:@"ByLine"];
        if(value != nil && value != [NSNull null]) {
            newsFeed.newsAuthor = value;
        }
    
        value = [newsFeedJSON valueForKey:@"DateLine"];
        if(value != nil && value != [NSNull null]) {
                newsFeed.newsDateLine = [NSDate dateFromMMMDDYYYYHHMMSSZZZ:value];
        }
        
        value = [newsFeedJSON valueForKey:@"Image"];
        if(value != nil && value != [NSNull null]) {
            
            id subValue = [value valueForKey:@"Photo"];
            if(subValue != nil && subValue != [NSNull null]) {
                newsFeed.newsPhotoURL = subValue;
            }
            
            subValue = [value valueForKey:@"Thumb"];
            if(subValue != nil && subValue != [NSNull null]) {
                newsFeed.newsPhotoURL = subValue;
            }
        }
        
    return newsFeed;
}
@end
