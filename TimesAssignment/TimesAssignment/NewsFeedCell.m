//
//  NewsFeedCell.m
//  TimesAssignment
//
//  Created by Saalis Umer on 22/08/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import "NewsFeedCell.h"
#import "NSDate+HS18.h"

@implementation NewsFeedCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)prepareForReuse
{
    _feed = nil;
    self.imvNews.image = nil;
    self.lblNewsAuthorAndTime.text = @"";
    self.lblNewsHeadLine.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFeed:(NewsFeed *)feed
{
    _feed = feed;
    [self validateProperties];
    [self validateLayout];
}

- (void)validateProperties
{
    self.lblNewsHeadLine.text = self.feed.newsHeadLine;
    self.lblNewsHeadLine.font = [UIFont systemFontOfSize:16];
    
    if (self.feed.newsAuthor.length>0 && [self.feed.newsDateLine isLessThanOneHourOld] == YES) {
        self.lblNewsAuthorAndTime.attributedText = [self attributedStringForAuthorTime];
    }
    else if (self.feed.newsAuthor.length>0)
    {
        self.lblNewsAuthorAndTime.attributedText = [self attributedStringForAuthor];
    }
    else if ([self.feed.newsDateLine isLessThanOneHourOld]== YES)
    {
        self.lblNewsAuthorAndTime.attributedText = [self attributedStringForTime];
    }
}

- (NSAttributedString*)attributedStringForAuthorTime
{
    NSString * string = [NSString stringWithFormat:@"%@ * %d minutes ago",self.feed.newsAuthor,abs((int)[self.feed.newsDateLine timeIntervalSinceNow])/60 ];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0,string.length)];
    
    NSRange authorRange  = [string rangeOfString:self.feed.newsAuthor];
    NSRange restStringRange = NSMakeRange(authorRange.length, string.length-authorRange.length);
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:authorRange];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:restStringRange];
    return attributedString;
}

- (NSAttributedString*)attributedStringForAuthor
{
    NSString * string = [NSString stringWithFormat:@"%@",self.feed.newsAuthor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0,string.length)];
    
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(0, string.length)];
    return attributedString;
}

- (NSAttributedString*)attributedStringForTime
{
    NSString * string = [NSString stringWithFormat:@"%d minutes ago",abs((int)[self.feed.newsDateLine timeIntervalSinceNow])/60 ];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0,string.length)];

    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length)];
    return attributedString;
}

- (void)validateLayout
{
    
}
@end
