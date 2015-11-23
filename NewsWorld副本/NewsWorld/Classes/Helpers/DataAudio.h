//
//  DataAudio.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^AudioData) (NSMutableArray *dataArray);
@interface DataAudio : NSObject

//
@property (copy, nonatomic) AudioData avdioData;
- (void)doDataParsing:(NSString *)url;
@end
