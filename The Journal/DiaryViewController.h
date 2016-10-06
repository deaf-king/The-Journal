//
//  ViewController.h
//  The Journal
//
//  Created by HRF on 16/8/28.
//  Copyright © 2016年 HRF. All right

#import <UIKit/UIKit.h>

#import "DBUtil.h"
#import "DiaryTableView.h"
#import "DiaryContentViewController.h"

@interface DiaryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DBUtil* db;
@property (strong, nonatomic) DiaryContentViewController* contentViewController;

@property (strong, nonatomic) DiaryTableView* diaryTableView;
@property (strong, nonatomic) NSMutableArray* dataSource;

@end
