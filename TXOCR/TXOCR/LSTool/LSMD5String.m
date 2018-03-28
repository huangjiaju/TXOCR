//
//  LSMD5String.m
//  TXOCR
//
//  Created by lhs7248 on 2018/3/2.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

#import "LSMD5String.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation LSMD5String
+ (NSString *)md5Encrypt:(NSString *)str{


    const char *cStr = [str UTF8String];
    if (cStr == NULL) {
        cStr = "";
    }
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash uppercaseString];
}
   
+(NSString *)encodeUrlString:(NSString *)string {
    return CFBridgingRelease(
                             CFURLCreateStringByAddingPercentEscapes(
                                                                     kCFAllocatorDefault,
                                                                     (__bridge CFStringRef)string,
                                                                     NULL,
                                                                     CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                     kCFStringEncodingUTF8)
                             );
}

@end
