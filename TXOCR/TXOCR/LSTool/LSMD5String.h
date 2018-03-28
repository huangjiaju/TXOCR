//
//  LSMD5String.h
//  TXOCR
//
//  Created by lhs7248 on 2018/3/2.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSMD5String : NSObject
//字符串的MD5值
+ (NSString *)md5Encrypt:(NSString *)str;
+(NSString *)encodeUrlString:(NSString *)string;

@end
