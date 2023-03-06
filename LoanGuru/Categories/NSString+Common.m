//
//  NSString+Common.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "NSString+Common.h"

@implementation NSString (Common)
- (NSString *)urlAllowChinese{
    BOOL ret = [self jk_isContainChinese];
    if (ret) {
        return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    return self;
}
@end
