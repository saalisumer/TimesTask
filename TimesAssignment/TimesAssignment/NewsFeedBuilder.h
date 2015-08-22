//
//  GoogleImageBuilder.h
//  TimesAssignment
//
//  Created by Saalis Umer on 29/07/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsFeed.h"
@interface NewsFeedBuilder : NSObject
+ (NewsFeed*)newsFeedObjectFromJSON:(id)newsFeedJSON;
@end
