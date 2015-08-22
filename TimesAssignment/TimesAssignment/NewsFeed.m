//
//  NewsFeed.m
//  TimesAssignment
//
//  Created by Saalis Umer on 22/08/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import "NewsFeed.h"

@implementation NewsFeed
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.newsItemId = @"";
        self.newsHeadLine = @"";
        self.newsPhotoURL = @"";
        self.newsAuthor = @"";
        self.newsDateLine = nil;
    }
    return self;
}

@end
