//
//  LGTokenSettingAndGetting.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "LGTokenSettingAndGetting.h"

static NSString *LG_sessionId = @"LG_sessionId";

static NSString *LG_iphoneNum = @"LG_iphoneNum";

@implementation LGTokenSettingAndGetting
+ (NSString *)getSessionId{
    NSString *sessionId = [[NSUserDefaults standardUserDefaults]objectForKey:LG_sessionId];
    return sessionId?sessionId:@"";
}

+ (void)setCurrentSessionId:(NSString *)sessionId{
    [[NSUserDefaults standardUserDefaults]setObject:sessionId forKey:LG_sessionId];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (NSString *)getUserIphoneNum{
    NSString *iphoneNum = [[NSUserDefaults standardUserDefaults]objectForKey:LG_iphoneNum];
    return iphoneNum?iphoneNum:@"";
}

+ (void)setUserIphoneNum:(NSString *)iphoneNum{
    [[NSUserDefaults standardUserDefaults]setObject:iphoneNum forKey:LG_iphoneNum];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
