//
//  DiaryItem.h
//  The Journal
//
//  Created by HRF on 16/10/5.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaryItem : NSObject

@property(nonatomic, strong)NSString* objectId;
@property(nonatomic, strong)NSString* title;
@property(nonatomic, strong)NSString* content;
@property(nonatomic, strong)NSDate* date;
@property(nonatomic, strong)NSString* whether;

- (instancetype)init;

@end
