//
//  AppDelegate.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/6.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "AFNetworking.h"
#import "APIManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[APIManager sharedManager] initSDKWithLaunchOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    TabBarController *tabBar = [[TabBarController alloc] init];
    
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    
    [self listenNetWorkingStatus];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 时实监听网络状态
-(void)listenNetWorkingStatus{
    //1:创建网络监听者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    //2:获取网络状态
    /*
     AFNetworkReachabilityStatusUnknown          = 未知网络，
     AFNetworkReachabilityStatusNotReachable     = 没有联网
     AFNetworkReachabilityStatusReachableViaWWAN = 蜂窝数据
     AFNetworkReachabilityStatusReachableViaWiFi = 无线网
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有联网");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"无线网");
                break;
            default:
                break;
        }
    }];
    
    //开启网络监听
    [manager startMonitoring];
}

@end
