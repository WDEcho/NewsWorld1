//
//  DataNBABase.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBAModel.h"
#import <UIKit/UIKit.h>
@interface DataNBABase : NSObject


// model 类型属性
@property (strong, nonatomic)NBAModel *nbaModel;

@property (nonatomic, strong) NSMutableArray *dataArray;
// 数据添加
-(void)addNBAData:(NBAModel *)nbaModel;
// 数据查询
-(NSMutableArray *)selectNBAdata ;
// 数据删除
- (void)deleteAllData;
@end
