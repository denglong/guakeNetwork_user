//
//  TabBarController.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/6.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "TabBarController.h"
#import "HomeController.h"
#import "NearbyController.h"
#import "OrderController.h"
#import "MyController.h"
#import "NavController.h"
#import "SuperViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeController *homePage = [[HomeController alloc] initWithNibName:@"HomeController" bundle:nil];
    homePage.tabBarItem.title = @"首页";
    homePage.title = @"首页";
    homePage.tabBarItem.image = [UIImage imageNamed:@"work"];
    homePage.tabBarItem.selectedImage = [UIImage imageNamed:@"work_highlighted"];
    NavController *homeNav = [[NavController alloc] initWithRootViewController:homePage];
    
    NearbyController *nearbyPage = [[NearbyController alloc] initWithNibName:@"NearbyController" bundle:nil];
    nearbyPage.tabBarItem.title = @"附近";
    nearbyPage.title = @"附近";
    nearbyPage.tabBarItem.image = [UIImage imageNamed:@"report"];
    nearbyPage.tabBarItem.selectedImage = [UIImage imageNamed:@"report_highlighted"];
    NavController *nearbyNav = [[NavController alloc] initWithRootViewController:nearbyPage];
    
    OrderController *orderPage = [[OrderController alloc] initWithNibName:@"OrderController" bundle:nil];
    orderPage.tabBarItem.title = @"订单";
    orderPage.title = @"订单";
    orderPage.tabBarItem.image = [UIImage imageNamed:@"message"];
    orderPage.tabBarItem.selectedImage = [UIImage imageNamed:@"message_highlighted"];
    NavController *orderNav = [[NavController alloc] initWithRootViewController:orderPage];
    
    MyController *myPage = [[MyController alloc] initWithNibName:@"MyController" bundle:nil];
    myPage.tabBarItem.title = @"我的";
    myPage.title = @"我的";
    myPage.tabBarItem.image = [UIImage imageNamed:@"my"];
    myPage.tabBarItem.selectedImage = [UIImage imageNamed:@"my_highlighted"];
    NavController *myNav = [[NavController alloc] initWithRootViewController:myPage];
    
    self.viewControllers = @[homeNav, nearbyNav, orderNav, myNav];
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#666666"];
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
