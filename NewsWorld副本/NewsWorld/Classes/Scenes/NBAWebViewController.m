//
//  NBAWebViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "NBAWebViewController.h"

@interface NBAWebViewController ()

@end

@implementation NBAWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, -54, self.view.frame.size.width, self.view.frame.size.height + 54)];
    // 取消反弹
    self.webView.scrollView.bounces = NO;
    // 创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
    //页面自适应
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    [self.view addSubview:_webView];
    // 加载页面
    [_webView loadRequest:request];
    // Do any additional setup after loading the view.
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
