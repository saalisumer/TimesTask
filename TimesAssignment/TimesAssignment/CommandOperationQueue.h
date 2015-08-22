//
//  CommandOperationQueue.h
//  TimesAssignment
//
//  Created by Saalis Umer on 29/07/15.
//  Copyright (c) 2015 Saalis Umer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommandOperationQueue : NSOperationQueue

+ (CommandOperationQueue *) instance;

@end
