//
//  SuperViewController.m
//  guakeNetwork_user
//
//  Created by 邓龙 on 2018/3/9.
//  Copyright © 2018年 denglong. All rights reserved.
//

#import "SuperViewController.h"
#import "APIManager.h"
#import "APIEvent.h"
#import "APIWebView.h"
#import "APIScriptMessage.h"
#import "APIModuleMethod.h"

@interface SuperViewController ()<APIWebViewDelegate, APIModuleMethodDelegate, APIScriptMessageDelegate>

@end

@implementation SuperViewController

+ (SuperViewController *)alloc:(NSString *)url {
    NSString *name = @"root";
    SuperViewController *superView = [SuperViewController windowContainerWithAttribute:@{@"url":url, @"name":name}];
    [superView startLoad];
    return superView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    APIManager *manager = [APIManager sharedManager];
    manager.webViewDelegate = self;
    manager.moduleMethodDelegate = self;
    manager.scriptMessageDelegate = self;
    
    [[APIEventCenter defaultCenter] addEventListener:self selector:@selector(handleEvent:) name:@"denglong"];
}

#pragma mark - 监听html页面发送的事件
- (void)handleEvent:(APIEvent *)event {
    NSLog(@"监听事件");
}

#pragma mark - APIWebViewDelegate
- (BOOL)webView:(APIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *url = request.URL.absoluteString;
    if ([url hasPrefix:@"http://www.taobao.com"]) {
        NSString *msg = @"不允许访问淘宝";
        NSLog(@"%@", msg);
        return NO;
    } else if ([url hasPrefix:@"http://www.baidu.com"]) {
        return YES;
    }
    return YES;
}

#pragma mark - APIScriptMessageDelegate
- (void)webView:(APIWebView *)webView didReceiveScriptMessage:(APIScriptMessage *)scriptMessage {
    if ([scriptMessage.name isEqual:@"abc"]) {
        NSString *msg = [NSString stringWithFormat:@"收到来自Html5的操作请求，访问的名称标识为%@，传入的参数为:%@", scriptMessage.name, scriptMessage.userInfo];
        
        NSLog(@"%@", msg);
        [webView sendResultWithCallback:scriptMessage.callback ret:@{@"result":@"value"} err:nil delete:YES];
    } else if ([scriptMessage.name isEqual:@"requestEvent"]) {
        [[APIEventCenter defaultCenter] sendEventWithName:@"fromNative" userInfo:@{@"value":@"哈哈哈，我是来自Native的事件"}];
    }
}

#pragma mark - APIModuleMethodDelegate
- (BOOL)shouldInvokeModuleMethod:(APIModuleMethod *)moduleMethod {
    if ([moduleMethod.module isEqualToString:@"api"] && [moduleMethod.method isEqualToString:@"sms"]) {
        return NO;
    }
    return YES;
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
