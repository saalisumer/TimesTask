//
//  NewsFeedCell.h
//  TimesAssignment
//
//  Created by Saalis Umer on 22/08/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsFeed.h"

@interface NewsFeedCell : UITableViewCell
@property(nonatomic, weak) IBOutlet UILabel * lblNewsHeadLine;
@property(nonatomic, weak) IBOutlet UILabel * lblNewsAuthorAndTime;
@property(nonatomic, weak) IBOutlet UIImageView * imvNews;

@property(nonatomic, weak) NewsFeed * feed;

@end
