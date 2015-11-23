//
//  TopTitle.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "TopTitle.h"

@implementation TopTitle


-(void)setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"imgextra"]) {
        
        
        
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}
-(NSString *)description{
    
    return [NSString stringWithFormat:@"%@--%@--%@",_title,_digest,_url];
}
@end
