//
//  AppDelegate.h
//  The Journal
//
//  Created by HRF on 16/8/28.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainViewController.h"
#import "DiaryViewController.h"
#import "AccountViewController.h"

#import "DBUtil.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *tabBarController;
@property (strong, nonatomic) DiaryViewController *diaryViewController;
@property (strong, nonatomic) AccountViewController *accountViewController;

@property (strong, nonatomic) DBUtil* db;

@end

