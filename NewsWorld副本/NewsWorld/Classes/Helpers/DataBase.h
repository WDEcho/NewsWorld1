//
//  DataBase.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
//数据解析
typedef void(^DataPars) (NSMutableArray *dataArray);
typedef void(^ImageData) (NSMutableArray *imageArray);
@interface DataBase : NSObject
// 数据block
@property (nonatomic, copy) DataPars dataPars;

//图片block

@property (copy, nonatomic) ImageData imagePars;
// 解析数据方法
- (void)doDataParsing:(NSString *)url;

//解析轮播图

-(void)doImages:(NSString *) url;

@end
