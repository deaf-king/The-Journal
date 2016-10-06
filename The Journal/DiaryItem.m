//
//  DiaryItem.m
//  The Journal
//
//  Created by HRF on 16/10/5.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import "DiaryItem.h"

@implementation DiaryItem

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        
        self.objectId = @"";
        self.title = @"日记";
        self.whether = @"未知";
        self.content = @"";
        self.date = [NSDate date];
    }
    
    return self;
}

@end
