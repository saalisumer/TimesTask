//
//  ApplicationModel.m
//  TimesAssignment
//
//  Created by Saalis Umer on 29/07/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import "ApplicationModel.h"
#import "NewsFeedBuilder.h"

@implementation ApplicationModel
static ApplicationModel *singletonInstance = nil;

+ (ApplicationModel *) instance {
	@synchronized(self) {
		if(!singletonInstance) {
			singletonInstance = [[ApplicationModel alloc] init];
            singletonInstance.newsFeeds = [[NSMutableArray alloc]init];
            singletonInstance.imageCache = [[NSCache alloc]init];
            singletonInstance.totalPages = 0;
            singletonInstance.currentPage = 0;
        }
	}
    
	return singletonInstance;
}

- (void)clearModel
{
    singletonInstance.newsFeeds = [[NSMutableArray alloc]init];
    singletonInstance.totalPages = 0;
    singletonInstance.currentPage = 0;
}

- (void)addFeedsToModel:(NSArray*)feedJSONArray
{
    for (id newsFeedJSON in feedJSONArray) {
        NewsFeed * feed = [NewsFeedBuilder newsFeedObjectFromJSON:newsFeedJSON];
        [self.newsFeeds addObject:feed];
    }
}

@end
