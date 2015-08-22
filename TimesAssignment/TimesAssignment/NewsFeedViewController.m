//
//  NewsFeedViewController.m
//  TimesAssignment
//
//  Created by Saalis Umer on 22/08/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "NewsFeedCommand.h"
#import "ApplicationModel.h"
#import "NewsFeedCell.h"
#import "ImageDownloadManager.h"
#import "MBProgressHUD.h"
#define kNewsCellIdentifier @"NEWS_CELL"

@interface NewsFeedViewController ()<CommandDelegate, ImageDownloadManagerDelegate>
{
    ApplicationModel * mApplicationModel;
    ImageDownloadManager *mImageDownloadManager;
    MBProgressHUD        *mHUD;
}
@end

@implementation NewsFeedViewController

- (void)viewDidLoad {
    mApplicationModel = [ApplicationModel instance];
    mImageDownloadManager = [ImageDownloadManager instance];
    
    mHUD = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:mHUD];
    [mHUD hide:NO];
    
    
    [self fetchNewsFeed];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)fetchNewsFeed
{
    NewsFeedCommand * newsFeedCommand = [[NewsFeedCommand alloc]init:self];
    [mHUD show:YES];
    [newsFeedCommand execute];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mApplicationModel.newsFeeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsFeedCell * cell = [tableView dequeueReusableCellWithIdentifier:kNewsCellIdentifier forIndexPath:indexPath];
    NewsFeed * feed = mApplicationModel.newsFeeds[indexPath.row];
    cell.feed = feed;
    cell.imvNews.image = [mImageDownloadManager loadImageForURL:[NSURL URLWithString:feed.newsPhotoURL] imageId:feed.newsItemId delegate:self];
    return cell;
}

#pragma mark Command Delegate
- (void)command:(Command *)cmd didReceiveResponse:(id)response
{
    [mHUD hide:YES];
    [self.tblNewsFeed reloadData];
}

- (void)command:(Command *)cmd didFailWithError:(NSError *)error
{
    [mHUD hide:YES];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Request Couldn't be completed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil ];
    [alert show];
}

#pragma mark Image Download Manager Delegate
- (void)loadImageForURL:(NSURL *)url imageId:(NSString *)imageId
            didComplete:(UIImage *)image
{
    [self.tblNewsFeed reloadData];
}

- (void)loadImageForURL:(NSURL *)url imageId:(NSString *)imageId
       didFailWithError:(NSError *)error
{
    
}
@end
