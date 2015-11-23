//
//  NBAViewCell.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "NBAViewCell.h"

@implementation NBAViewCell

-(void)setModel:(NBAModel *)model{
    if (_model ==nil) {
        _model = model;
    }
    [self.ImgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.digest;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
