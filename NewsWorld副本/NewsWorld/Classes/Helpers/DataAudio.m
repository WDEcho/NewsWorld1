//
//  DataAudio.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "DataAudio.h"
#import "AudioModel.h"
@implementation DataAudio


- (void)doDataParsing:(NSString *)url{
    
   
        // 1.创建AFHTTPRequestOperationManager ---HTTP请求操作管理类的对象
        AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
        // 2.发送get请求
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            // 用字典来承接数据
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSMutableArray * muArray = [NSMutableArray array];
            //NSArray * keyArray = [dic allKeys];
            NSArray *array = dic[@"videoList"];
            
            for (NSDictionary * dicy in array) {
                AudioModel *avdio = [AudioModel new];
                [avdio setValuesForKeysWithDictionary:dicy];
                [muArray addObject:avdio];
            }
      
            self.avdioData(muArray);
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
   
    

    
}
@end
