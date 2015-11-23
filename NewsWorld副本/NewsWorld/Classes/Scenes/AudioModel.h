//
//  AudioModel.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioModel : NSObject
// 视频标题
@property (nonatomic, strong) NSString *title;
// 视频描述
@property (nonatomic, strong) NSString *Description;
// 视频时长
@property (nonatomic, assign) NSInteger length;
// 播放次数
@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, strong) NSString *cover;
// 播放视频网址
@property (nonatomic, strong) NSString *m3u8_url;
@property (nonatomic, strong) NSString *m3u8HD_url;
@property (nonatomic, strong) NSString *mp4_url;
@property (nonatomic, strong) NSString *mp4HD_url;

@property(nonatomic, assign) BOOL isPlaying;

@end
