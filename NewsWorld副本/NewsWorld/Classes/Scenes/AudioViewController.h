//
//  AudioViewController.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AudioViewController : UIViewController<UIWebViewDelegate>
// 上一个页面传过来的url
@property (strong, nonatomic) NSString *urlStr;
//
@property (strong, nonatomic) UIWebView *webView;

@property (strong, nonatomic) UIActivityIndicatorView *activityView;

// 加载页面时候用到的UIView
@property (strong, nonatomic)UIView *aView;
@end
