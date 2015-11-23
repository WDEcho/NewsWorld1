//
//  NewsImageTableViewCell.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "NewsImageTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation NewsImageTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        // title
        self.titleLB  = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, kWidth - 10, 20)];
        // self.titleLB.backgroundColor = [UIColor cyanColor];
        [self addSubview:_titleLB];
        
        // imageView
        
        self.leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 25, (kWidth - 20) / 3, 80)];
       // _leftImgView.backgroundColor = [UIColor blueColor];
        [self addSubview:_leftImgView];
        
        self.middleImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+ (kWidth - 20) / 3 + 5, 25 , (kWidth - 20) / 3, 80)];
        _middleImgView.backgroundColor = [UIColor redColor];
        [self addSubview:_middleImgView];
        
        self.rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+ 2 * (kWidth - 20) / 3 + 10, 25 , (kWidth - 20) / 3, 80)];
        _rightImgView .backgroundColor = [UIColor greenColor];
        [self addSubview:_rightImgView];
        
    }
    return self;
}

-(void)setTopTitle:(TopTitle *)topTitle
{
    if (_topTitle == nil) {
        _topTitle = topTitle;
    }
    
    self.titleLB.text = topTitle.title;
    [_leftImgView sd_setImageWithURL:[NSURL URLWithString:topTitle.imgsrc]];
    [self.middleImgView sd_setImageWithURL:[NSURL URLWithString:[topTitle.imgextra[0]objectForKey:@"imgsrc"]]];
    
    [self.rightImgView sd_setImageWithURL:[NSURL URLWithString:[topTitle.imgextra[1]objectForKey:@"imgsrc"]]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
