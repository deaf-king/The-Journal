//
//  MainViewController.m
//  The Journal
//
//  Created by HRF on 16/8/28.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.diaryViewController = [[DiaryViewController alloc] init];
    self.accountViewController = [[AccountViewController alloc] init];
    
    UINavigationController* diaryNavigationController = [[UINavigationController alloc] initWithRootViewController:self.diaryViewController];
    UINavigationController* accountNavigationController = [[UINavigationController alloc] initWithRootViewController:self.accountViewController];
    
    [self setViewControllers:@[diaryNavigationController, accountNavigationController] animated:YES];
    
    UITabBar *tabBar = self.tabBar;
    
    UITabBarItem *diaryBarItem = tabBar.items[0];
    UITabBarItem *accountBarItem = tabBar.items[1];
    
    diaryBarItem.title = @"Diary";
    accountBarItem.title = @"Account";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)start {
    
    [self loging];
}

- (UIAlertController*)makeLoginAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"User";
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Password";
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *loginAction = [UIAlertAction actionWithTitle:@"login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *user = alertController.textFields[0].text;
        NSString *passwoed = alertController.textFields[1].text;
        
        if ([user isEqualToString:@"root"] && [passwoed isEqualToString:@"root"]) {
            NSLog(@"loggin success!!!");
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:loginAction];
    
    return alertController;
}

- (void)loging {
    
    UIAlertController* alertController = [self makeLoginAlert];
    [self presentViewController:alertController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
