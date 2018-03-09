//
//  NavController.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/6.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "NavController.h"

@interface NavController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) id popDelegate;

@end

@implementation NavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    //全屏侧滑返回 UIGestureRecognizerDelegate代理
    //    id target = self.interactivePopGestureRecognizer.delegate;
    //    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    //    pan.delegate = self;
    //    [self.view addGestureRecognizer:pan];
    //    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma UINavigationControllerDelegate方法
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.delegate =  viewController == self.viewControllers[0]? self.popDelegate : nil;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    return YES;
//}
//
//- (void)handleNavigationTransition:(UIPanGestureRecognizer *)recognizer {}

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
