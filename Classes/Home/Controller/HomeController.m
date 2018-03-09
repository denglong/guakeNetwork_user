//
//  HomeController.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/6.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "HomeController.h"
#import "SDCycleScrollView.h"
#import "HomeLoopCell.h"
#import "ClassifyCell.h"

@interface HomeController ()<SDCycleScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) SDCycleScrollView *cycleScrollerView;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCellAction];
    
//    [MBProgressHUD showProgress:self.view];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - 注册Cell
- (void)registerCellAction {
    _homeTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [_homeTableView registerNib:[UINib nibWithNibName:@"HomeLoopCell" bundle:nil] forCellReuseIdentifier:@"HomeLoopCell"];
    [_homeTableView registerNib:[UINib nibWithNibName:@"ClassifyCell" bundle:nil] forCellReuseIdentifier:@"ClassifyCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:case 1:case 2:
            return 1;
            break;
        default:
            return 5;
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 130;
    }
    else if (indexPath.section == 1) {
        return 70;
    }
    else if (indexPath.section == 2) {
        return 150;
    }
    else{
        return 60;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 0;
    }
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, 10)];
    footView.backgroundColor = [UIColor clearColor];
    return footView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        HomeLoopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeLoopCell"];
        [cell setCycleViewImage:@[@"apicloud-bg",@"apicloud-bg",@"apicloud-bg"]];
        cell.cycleView.delegate = self;
        return cell;
    }
    else {
        ClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClassifyCell"];
        return cell;
    }
}

#pragma mark - 轮播图点击事件
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld", (long)index);
    
    NSString *url = @"widget://html/set_win.html";
    SuperViewController *superView = [SuperViewController alloc:url];
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:superView animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
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
