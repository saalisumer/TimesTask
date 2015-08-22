//
//  NSDate+HS18.h
//  TimesAssignment
//
//  Created by Admin on 2/18/13.
//  Copyright (c) 2013 HomeShop18. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HS18)

+ (NSDate*) dateFromMMMDDYYYYHHMMSSZZZ:(NSString*)dateLine;
- (BOOL)isLessThanOneHourOld;
@end
