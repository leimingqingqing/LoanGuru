//
//  LGTokenSettingAndGetting.h
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface LGTokenSettingAndGetting : NSObject
+ (NSString *)getSessionId;

+ (void)setCurrentSessionId:(NSString *)sessionId;

+ (NSString *)getUserIphoneNum;

+ (void)setUserIphoneNum:(NSString *)iphoneNum;
@end

NS_ASSUME_NONNULL_END
