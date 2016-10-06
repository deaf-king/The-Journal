//
//  ViewController.m
//  The Journal
//
//  Created by HRF on 16/8/28.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import "DiaryViewController.h"

@interface DiaryViewController ()

- (void)addTable;
- (NSString*)dateToString:(NSDate*)date;

@end

@implementation DiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.db = [DBUtil getInstance];
    self.contentViewController = [[DiaryContentViewController alloc] init];
    
    self.diaryTableView = [[DiaryTableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.diaryTableView.delegate = self;
    self.diaryTableView.dataSource = self;
    
    //DEBUG
    DiaryItem* item = [[DiaryItem alloc] init];
    item.objectId = 0;
    item.title = @"now";
    item.content = @"content";
    item.date = [NSDate date];
    item.whether = @"雨";
    
    [self.db addItem:item];
    
    self.dataSource = [self.db queryItems];
    
    self.navigationItem.title = @"日记";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTable)];
    
    [self.view addSubview:self.diaryTableView];
}

- (void)addTable {
    DiaryItem* item = [[DiaryItem alloc] init];
    [self.db addItem:item];
    [self.dataSource insertObject:item atIndex:0];
    
    [self.diaryTableView reloadData];
    //NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //[self.diaryTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:self.contentViewController animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //固定的tableViewCell复用写法
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
        
    cell.textLabel.text = [self dateToString:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (NSString*)dateToString:(NSDate*)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate转NSString
    NSString* dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
