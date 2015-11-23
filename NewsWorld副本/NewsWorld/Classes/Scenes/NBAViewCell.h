//
//  NBAViewCell.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBAModel.h"
@interface NBAViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *ImgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, strong) NBAModel *model;
@end
