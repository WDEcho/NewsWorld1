//
//  NewsTableViewCell.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "NewsTableViewCell.h"
#define EDGE_LARGE 20
#define EDGE_MIDDEL 10
#define EDGE_SMALL 5
@implementation NewsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        // 左图片
        self.leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(EDGE_SMALL, EDGE_SMALL, kWidth / 4 - 5, 100)];
       // _leftImgView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_leftImgView];
        
        // title
        self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4 + EDGE_SMALL*2, EDGE_SMALL, kWidth/4 * 3 - 25, 20)];
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.font = [UIFont systemFontOfSize:17 weight:17];
        //_titleLB.backgroundColor = [UIColor greenColor];
        [self addSubview:_titleLB];
        
        self.contextLB = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/4 + EDGE_SMALL*2, 30,  kWidth/4 * 3 - 25, 50)];
        _contextLB.font = [UIFont systemFontOfSize:15];
        _contextLB.numberOfLines = 0;
        [self addSubview:_contextLB];
        
    }
    return self;
}
// 重写set方法
-(void)setTopTitle:(TopTitle *)topTitle{
    if (_topTitle == nil) {
        _topTitle = topTitle;
    }
    [self.leftImgView sd_setImageWithURL:[NSURL URLWithString:topTitle.imgsrc]];
    
    self.titleLB.text = topTitle.title;
    
    self.contextLB.text = topTitle.digest;

  
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
