//
//  NewsTableViewCell.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopTitle.h"
@interface NewsTableViewCell : UITableViewCell
// 左边的图片
@property (nonatomic, strong) UIImageView * leftImgView;

// title
@property (nonatomic, strong) UILabel * titleLB;

// 简介
@property (nonatomic, strong) UILabel * contextLB;

// 跟帖
@property (nonatomic, strong) UILabel * commentsLB;
// model属性
@property (strong, nonatomic) TopTitle *topTitle;
@end
