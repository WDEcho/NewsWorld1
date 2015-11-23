//
//  DataBase.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "DataBase.h"
#import "TopTitle.h"
#import "ShuffImage.h"
@implementation DataBase
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
            NSArray * keyArray = [dic allKeys];
         
            for (NSString * str in keyArray) {
                NSArray * array = dic[str];
                for (NSDictionary * dicy in array) {
                    TopTitle * toptitle = [TopTitle new];
                    [toptitle setValuesForKeysWithDictionary:dicy];
                    [muArray addObject:toptitle];
                }
            }
            self.dataPars(muArray);
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
   
}

-(void)doImages:(NSString *)url{
    
   
    // 1.创建AFHTTPRequestOperationManager ---HTTP请求操作管理类的对象
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    // 2.发送get请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        // 用字典来承接数据
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray * muArray = [NSMutableArray array];
        NSArray * keyArray = dic[@"T1348647853363"];
        NSDictionary * dicy = keyArray[0];
        for (NSDictionary * str in dicy[@"ads"]) {
            NSString * ste = str[@"imgsrc"];
           // NSLog(@"ssssss");
            [muArray addObject:ste];
           // NSLog(@"asadasdsadsasad%@",muArray);
    
            
        }
        
        self.imagePars(muArray);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
   
    
}
@end
