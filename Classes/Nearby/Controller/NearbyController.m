//
//  NearbyController.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/6.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "NearbyController.h"
#import "SDCycleScrollView.h"
#import "HomeLoopCell.h"

@interface NearbyController ()<SDCycleScrollViewDelegate, UITabBarDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *nearbyTableView;

@end

@implementation NearbyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCellAction];
}

#pragma mark - 注册Cell
- (void)registerCellAction {
    _nearbyTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_nearbyTableView registerNib:[UINib nibWithNibName:@"HomeLoopCell" bundle:nil] forCellReuseIdentifier:@"HomeLoopCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeLoopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeLoopCell"];
    [cell setCycleViewImage:@[@"apicloud-bg",@"apicloud-bg",@"apicloud-bg"]];
    cell.cycleView.delegate = self;
    return cell;
}

#pragma mark - 轮播图点击事件
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld", (long)index);
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
