//
//  ApplicationModel.h
//  TimesAssignment
//
//  Created by Saalis Umer on 29/07/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsFeed.h"

@interface ApplicationModel : NSObject
@property(nonatomic, strong) NSMutableArray * newsFeeds;
@property(nonatomic, strong) NSCache        * imageCache;
@property(nonatomic, assign) NSUInteger       totalPages;
@property(nonatomic, assign) NSUInteger       currentPage;


+ (ApplicationModel *) instance;

- (void)clearModel;

- (void)addFeedsToModel:(NSArray*)feedJSONArray;

@end
