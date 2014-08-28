//
//  Bootstrap.h
//  RITraining
//
//  Created by  on 14-1-8.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "DiskCache.h"
#import "FMDatabase.h"

@interface Bootstrap : NSObject

@property (atomic, retain) AppConfig *config;
@property (atomic, retain) DiskCache *cache;

+ (id)getInstance;
- (void)bootstrap;

@end
