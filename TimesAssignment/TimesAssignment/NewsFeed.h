//
//  NewsFeed.h
//  TimesAssignment
//
//  Created by Saalis Umer on 22/08/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsFeed : NSObject
@property (nonatomic, strong) NSString * newsItemId;
@property (nonatomic, strong) NSString * newsHeadLine;
@property (nonatomic, strong) NSString * newsAuthor;
@property (nonatomic, strong) NSDate   * newsDateLine;
@property (nonatomic, strong) NSString * newsPhotoURL;

@end
