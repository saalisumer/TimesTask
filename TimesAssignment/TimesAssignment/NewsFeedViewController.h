//
//  NewsFeedViewController.h
//  TimesAssignment
//
//  Created by Saalis Umer on 22/08/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * tblNewsFeed;
@end
