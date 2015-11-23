//
//  WebViewViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_urlStr);
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
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//手机的网络环境是实时变化的，网络慢的时候，怎么提示用户网页正在打开呢？在网页打开出错的时候怎么提示用户呢？这时候我们就需要知道网页什么时候打开的，什么时候加载完成，什么时候出错了。那么我们需要实现这个<UIWebViewDelegate>协议

#pragma mark -----UIWebViewDelegate

////网页开始加载时调用
//- (void)webViewDidStartLoad:(UIWebView *)webView{
//    //创建UIActivityIndicatorView的背景视图
//    self.aView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.aView.backgroundColor = [UIColor cyanColor];
//    //设置透明度
//    self.aView.alpha = 0.5;
//    
//    [self.view addSubview:_aView];
//    
//    //加载指示视图
//    self.activityView = [[UIActivityIndicatorView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    _activityView.center = _aView.center;
//    [_activityView setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
//    //    _activityView.hidesWhenStopped = YES;
//    
//    
//    //再背景上加载
//    [_aView addSubview:_activityView];
//    //动画开启
//    [_activityView startAnimating];
//    NSLog(@"网页开始加载");
//    
//}
////完成加载时调用
//- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    //停止动画效果
//    [_activityView stopAnimating];
//    //从视图上移除
//    [self.view removeFromSuperview];
//    NSLog(@"网页完成加载");
//    
//}
////加载错误时调用
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [_activityView stopAnimating];
//    //从视图上移除
//    [self.view removeFromSuperview];
//    NSLog(@"加载错误:%@",error);
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
