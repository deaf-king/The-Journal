//
//  DBUtil.h
//  The Journal
//
//  Created by HRF on 16/10/5.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "fmdb/FMDatabase.h"
#import "DiaryItem.h"

@interface DBUtil : NSObject

+ (instancetype)getInstance;

- (NSMutableArray *)queryItems;

- (void)addItem:(DiaryItem*)item;
- (void)deleteItem:(NSString*)objectId;

- (void)addItems:(NSArray*)items;
- (void)deleteItems:(NSArray*)items;

@end
