//
//  NSDate+HS18.m
//  TimesAssignment
//
//  Created by Admin on 2/18/13.
//  Copyright (c) 2013 HomeShop18. All rights reserved.
//

#import "NSDate+HS18.h"

@implementation NSDate (HS18)
+ (NSDate*) dateFromMMMDDYYYYHHMMSSZZZ:(NSString*)dateLine
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy, h.mma 'IST'"];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+5:30"]];
    NSDate *date = [dateFormatter dateFromString:dateLine ];
    return date;
}

- (BOOL)isLessThanOneHourOld
{
    if ([self timeIntervalSinceNow] > -60*60) { //1 hour
        return YES;
    }
    return NO;
}

@end
