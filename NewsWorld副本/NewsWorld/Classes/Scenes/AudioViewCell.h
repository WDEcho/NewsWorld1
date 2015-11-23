//
//  AudioViewCell.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioModel.h"
#import <AVFoundation/AVFoundation.h>

typedef void (^AudioIsplaying)();
@interface AudioViewCell : UITableViewCell

@property (nonatomic, strong) AudioModel *audioModel;
@property (nonatomic, strong) NSString *url;

@property (copy, nonatomic) AudioIsplaying block;

- (IBAction)btn:(UIButton *)sender;

@end
