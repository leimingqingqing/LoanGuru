//
//  LGHelper.h
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGHelper : NSObject
+ (NSString *)getCurrentDeviceModel;

+ (NSString *)getIdfa;

+ (NSString *)getIdfv;
@end

NS_ASSUME_NONNULL_END
