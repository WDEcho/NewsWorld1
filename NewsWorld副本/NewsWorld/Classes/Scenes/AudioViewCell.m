//
//  AudioViewCell.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "AudioViewCell.h"

@interface AudioViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descrptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *playCountLabel;
@property (strong, nonatomic) IBOutlet UIView *bofangView;
@property (strong, nonatomic) AVPlayerItem *item;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *playerLayer;
@property (strong, nonatomic) NSString *currentURL;

- (IBAction)btn:(UIButton *)sender;
@end
@implementation AudioViewCell



-(void)setAudioModel:(AudioModel *)audioModel{
    
    if (!_audioModel) {
        _audioModel = audioModel;
    }
    self.titleLabel.text = audioModel.title;
    self.descrptionLabel.text = audioModel.description;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:audioModel.cover]];
    
    NSString *str = [NSString stringWithFormat:@"%ld:%ld",audioModel.length/60,audioModel.length%60];
    self.timeLabel.text =str;
    
    double f= audioModel.playCount/10000.0;
    self.playCountLabel.text = [NSString stringWithFormat:@"%.1f万",f];
    self.item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:audioModel.m3u8_url]];
    // 判断当前播放状态
    if (audioModel.isPlaying == 1) {
        [_player replaceCurrentItemWithPlayerItem:_item];
        [self.player play];
    }else{
        _item = nil;
        [_player replaceCurrentItemWithPlayerItem:_item];
        [_player pause];
    }
    
}
- (void)awakeFromNib {
    // 创建一个item
    //NSLog(@"asdadadadadaddadsadsadas%@",self.audioModel.m3u8_url);
    // 初始化播放器
    self.player = [[AVPlayer alloc] initWithPlayerItem:_item];
    // 获取播放器的layer
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    // 设置播放器的layer
    _playerLayer.frame = self.imgView.bounds;
//    UIView *aView = [[UIView alloc]init];
//    aView.frame = self.bofangView.frame;
//    _playerLayer.frame = aView.frame;
//    [self addSubview:aView];
    
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    //_playerLayer.backgroundColor = [[UIColor blueColor] CGColor];
    // 讲layer添加到当期页面的layer层中
    [self.imgView.layer addSublayer:_playerLayer];
    // 播发器开始播放
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)btn:(UIButton *)sender {
    
//    if ([sender.currentTitle isEqualToString:@"播放"]) {
//        [sender setTitle:@"取消" forState:(UIControlStateNormal)];
//    }else if([sender.currentTitle isEqualToString:@"取消"]){
//        [sender setTitle:@"播放" forState:(UIControlStateNormal)];
//    }
    _block();
}
@end
