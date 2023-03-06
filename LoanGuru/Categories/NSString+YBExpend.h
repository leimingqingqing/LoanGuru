//
//  NSString+YBExpend.h
//  youonBikePlanA
//
//  Created by 李青 on 2017/12/11.
//  Copyright © 2017年 audi. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (YBExpend)
/**
 *    变成星星
 **/
- (NSString *)replaceStringWithAsteriskStartLocation:(NSInteger)startLocation lenght:(NSInteger)lenght;

//1.1 验证电话号码
- (BOOL)checkTelephoneNumber;
//1.2 验证身份证
+(BOOL)accurateVerifyIDCardNumber:(NSString *)value;
//图片类型
+ (NSString *)typeForImageData:(NSData *)data;
//转成千米，或者米
- (NSString *)yb_formatDistance;
//专成秒分钟或者时间
- (NSString *)yb_formatDuration;
//丢失精度
+(NSString *)reviseString:(NSString *)string;
//1.4 验证纯数字
- (BOOL)checkJustNumber;
//解析停车位的图片(缩减成20)
- (NSString *)yb_getYouonSmallImage;

- (NSString *)yb_getYouonSmallImageWithPercent:(NSInteger)percent;
@end
