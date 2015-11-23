//
//  NBAWebViewController.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBAWebViewController : UIViewController<UIWebViewDelegate>
// 上一个页面传过来的url
@property (strong, nonatomic) NSString *urlStr;
//
@property (strong, nonatomic) UIWebView *webView;


@end
