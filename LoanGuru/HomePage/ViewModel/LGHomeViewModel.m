//
//  LGHomeViewModel.m
//  LoanGuru
//
//  Created by Apple on 2023/3/6.
//

#import "LGHomeViewModel.h"

@implementation LGHomeViewModel
+(NSURLSessionDataTask *_Nullable)getHomeInfoSuccess:(nonnull callbackSuccess)success
                                                fail:(nullable callbackFail)fail{
    NSString *params = [NSString stringWithFormat:@"misty=%@&memorable=%@",@"misty",@"memorable"];
    return [LGNET yb_post:@"guru/elder-perseverance-shook" params:params ifGet:YES autoShowError:YES hudStyle:0 hudMsg:@"" backBlock:^(LGApiModel *dataModel) {
        success(dataModel);
    } errorBlock:^(LGApiModel *dataModel, NSInteger errorCode) {
        if(fail){fail(dataModel,errorCode);}
    }];
}
@end
