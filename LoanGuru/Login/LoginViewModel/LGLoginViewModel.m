//
//  LGLoginViewModel.m
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import "LGLoginViewModel.h"

@implementation LGLoginViewModel
+(NSURLSessionDataTask *_Nullable)getVertifyCodeWithDeceived:(NSString * _Nonnull)deceived
                                               treacherously:(NSString * _Nonnull)treacherously
                                                       Success:(nonnull callbackSuccess)success
                                                        fail:(nullable callbackFail)fail{
    NSString *params = [NSString stringWithFormat:@"deceived=%@&treacherously=%@",deceived,treacherously];
    return [LGNET yb_post:@"guru/support-evidently-cares" params:params ifGet:NO autoShowError:YES hudStyle:0 hudMsg:@"" backBlock:^(LGApiModel *dataModel) {
        success(dataModel);
    } errorBlock:^(LGApiModel *dataModel, NSInteger errorCode) {
        if(fail){fail(dataModel,errorCode);}
    }];
}

+(NSURLSessionDataTask *_Nullable)loginWithActed:(NSString * _Nonnull)acted
                                       spectacle:(NSString * _Nonnull)spectacle
                                     interesting:(NSString * _Nonnull)interesting
                                         ashamed:(NSString * _Nonnull)ashamed
                                         Success:(nonnull callbackSuccess)success
                                            fail:(nullable callbackFail)fail{
    NSString *params = [NSString stringWithFormat:@"acted=%@&spectacle=%@&interesting=%@&ashamed=%@",acted,spectacle,interesting,ashamed];
    return [LGNET yb_post:@"guru/being-cannot-condition" params:params ifGet:NO autoShowError:YES hudStyle:0 hudMsg:@"" backBlock:^(LGApiModel *dataModel) {
        success(dataModel);
    } errorBlock:^(LGApiModel *dataModel, NSInteger errorCode) {
        if(fail){fail(dataModel,errorCode);}
    }];
}
@end
