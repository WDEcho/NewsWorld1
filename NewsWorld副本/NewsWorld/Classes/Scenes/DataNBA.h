//
//  DataNBA.h
//  NewsWorld
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataPars) (NSMutableArray *dataArray);
@interface DataNBA : NSObject
// 数据block
@property (nonatomic, copy) DataPars dataPars;
- (void)doDataParsing:(NSString *)url;
@end
