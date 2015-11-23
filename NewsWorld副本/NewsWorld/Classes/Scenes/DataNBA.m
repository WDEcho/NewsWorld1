//
//  DataNBA.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "DataNBA.h"
#import "NBAModel.h"
#import "DataNBABase.h"
@implementation DataNBA


- (void)doDataParsing:(NSString *)url{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    // 3.建立会话
    //  NSURLSession  支持三种类型的任务，加载数据，下拉，上传
    //  NSURLSessionDataTask
    //  NSURLSessionDownloadTask
    //  NSURLSessionUploadTask
    NSURLSession *session= [NSURLSession sharedSession];
    
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSMutableArray *dataArray =[NSMutableArray array];
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSArray * keyArray = [dic allKeys];
        for (NSString * str in keyArray) {
            NSArray * array = dic[str];
            DataNBABase *dataBase = [DataNBABase new];
            [dataBase deleteAllData];
            for (NSDictionary * dicy in array) {
                NBAModel * model = [NBAModel new];
                [model setValuesForKeysWithDictionary:dicy];
                [dataArray addObject:model];
                //存储model类型的数据到数据库
                [dataBase addNBAData:model];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dataPars(dataArray);
        });
    }];
    //  使用resume方法启动任务
    [task resume];
    

}

@end
