//
//  DataNBABase.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "DataNBABase.h"
#import "FMDB.h"
#import "NBAModel.h"
@implementation DataNBABase
static FMDatabaseQueue *_queue;

-(void)setup{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)lastObject];
    NSString *documentPath = [path stringByAppendingString:@"NBA.sqlite"];
    
   // NSLog(@"%@",documentPath);
    //创建队列
    _queue = [FMDatabaseQueue databaseQueueWithPath:documentPath];
    
    //创建表
    [_queue inDatabase:^(FMDatabase *db) {
        
        [db executeUpdate:@"create table if not exists nba(id integer primary key autoincrement, nbaData blob)"];
    }];
}
//存储数据
-(void)addNBAData:(NBAModel *)nbaModel{
    
    [self setup];
    
    [_queue inDatabase:^(FMDatabase *db) {
        // 获得要存储的数据
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:nbaModel];
        // 存储数据
        [db executeUpdate:@"insert into nba(nbaData) values(?)",data];
    }];
    
    [_queue close];
}
//删除数据
- (void)deleteAllData{
    [self setup];
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"delete from nba"];
    }];
    [_queue close];
}

// 查询数据

-(NSMutableArray *)selectNBAdata {
    [self setup];
    NSMutableArray *array = [NSMutableArray array];
    [_queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs= nil;
        
        rs =[db executeQuery:@"select *from nba"];
        while (rs.next) {
            NSData *data = [rs dataForColumn:@"nbaData"];
            NBAModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [array addObject:model];
        }
        
    }];
    return array;
}

@end
