//
//  ShuffImage.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "ShuffImage.h"

@implementation ShuffImage

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@", _title,_imgsrc];
}
@end
