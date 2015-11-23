//
//  NewsImageTableViewCell.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopTitle.h"
@interface NewsImageTableViewCell : UITableViewCell
// title
@property (nonatomic, strong) UILabel * titleLB;

// 图片
@property (nonatomic, strong) UIImageView * leftImgView;
@property (nonatomic, strong) UIImageView * middleImgView;
@property (nonatomic, strong) UIImageView * rightImgView;
// model属性
@property (strong, nonatomic) TopTitle *topTitle;

@end
