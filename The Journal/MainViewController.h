//
//  MainViewController.h
//  The Journal
//
//  Created by HRF on 16/8/28.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiaryViewController.h"
#import "AccountViewController.h"

@interface MainViewController : UITabBarController

@property (strong, nonatomic) DiaryViewController* diaryViewController;
@property (strong, nonatomic) AccountViewController* accountViewController;

- (void)start;
- (void)loging;

@end
