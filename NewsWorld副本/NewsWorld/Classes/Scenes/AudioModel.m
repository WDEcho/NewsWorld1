//
//  AudioModel.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "AudioModel.h"

@implementation AudioModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"description"]) {
        self.Description = value;
    }
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@", _title,_Description];
}
@end
