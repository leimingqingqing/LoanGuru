//
//  LGNetwork.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "LGNetwork.h"
#import "LGTokenSettingAndGetting.h"
@implementation LGNetwork
static LGNetwork *_shareNet = nil;

+ (instancetype)shareNet{
     static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
          _shareNet = [self createDefaultInstance];
     });
     return _shareNet;
}

+ (instancetype)createDefaultInstance{
    NSURL *baseURL = [NSURL URLWithString:@"http://147.139.6.147:8093/gulu/"];
    LGNetwork *net = [[self alloc] initWithBaseURL:baseURL];
    net.requestSerializer = [AFJSONRequestSerializer serializer];
    net.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"multipart/form-data", nil];
    net.requestSerializer.timeoutInterval = 20;
    return net;
}

- (NSURLSessionDataTask *)yb_post:(NSString *)path
                           params:(NSString *)paramsStr
                            ifGet:(BOOL)ifGet
                    autoShowError:(BOOL)autoShowError
                         hudStyle:(YBNetHUDStyle)hudStyle
                           hudMsg:(NSString *)hudMsg
                        backBlock:(void(^)(LGApiModel *dataModel))block
                       errorBlock:(void(^)(LGApiModel *dataModel,NSInteger errorCode))errorBlock{
    if(self.reachabilityManager.networkReachabilityStatus == 0){
         [LGProgressHUD showTipMessageInWindow:@"Please check network permissions"];
         return nil;
    }
    
    if (hudStyle != LGNetHUDStyleNone) {
         if (hudStyle == LGNetHUDStyleOnView) {
              [LGProgressHUD showActivityMessageInView:hudMsg];
         }else if (hudStyle == LGNetHUDStyleOnWindow){
              [LGProgressHUD showActivityMessageInWindow:hudMsg];
         }
    }
    NSString *heiress = @"ios";
    NSString *granddaughter = [NSObject jk_version];
    NSString *aunt = [LGHelper getCurrentDeviceModel];
    NSString *uncle = [LGHelper getIdfv];
    NSString *belonged = [UIDevice jk_systemVersion];
    NSString *worked = @"appstore-LoanGuru";
    NSString *homestead = [LGTokenSettingAndGetting getSessionId];
    NSString *petition = [LGHelper getIdfv];
    NSString *friends = @"friends";
    
    NSString *url = @"http://147.139.6.147:8093/gulu/";
    url = [NSString stringWithFormat:@"%@%@?heiress=%@&granddaughter=%@&aunt=%@&uncle=%@&belonged=%@&worked=%@&homestead=%@&petition=%@&friends=%@&%@",url,path,heiress,granddaughter,aunt,uncle,belonged,worked,homestead,petition,friends,paramsStr];
    NSLog(@"URL: %@ --- %@", url,path);
    if(ifGet){
        NSLog(@"*********GET*********");
        return [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"URL: %@\n shuju --- %@", path, responseObject);

            if (hudStyle != LGNetHUDStyleNone ) {
                 [LGProgressHUD hideHUD];
            }
        
            LGApiModel *apiModel = [self handleResponse:responseObject autoShowError:autoShowError urlStr:path];
            if (!apiModel) {
                 if (errorBlock) {
                      errorBlock(apiModel,999);
                 }
                 return ;
            }
            
            if (apiModel.code.integerValue == 0) {
                 !block?:block(apiModel);
            }else{
                 if (apiModel.code.integerValue == -2) {
                      [[NSNotificationCenter defaultCenter] postNotificationName:LGLoginErrorNotification object:nil userInfo:@{@"statecode":apiModel.code}];
                 }
                 
                 !errorBlock?:errorBlock(apiModel,apiModel.code.integerValue);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (hudStyle != LGNetHUDStyleNone) {
                 [LGProgressHUD hideHUD];
            }
            NSLog(@"error = %@",error.description);
            !errorBlock?:errorBlock(nil,error.code);
        }];
    }else{
       NSLog(@"*********POST*********");
       return [self POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"URL: %@\n shuju --- %@", path, responseObject);
            
            if (hudStyle != LGNetHUDStyleNone ) {
                [LGProgressHUD hideHUD];
            }
            
            LGApiModel *apiModel = [self handleResponse:responseObject autoShowError:autoShowError urlStr:path];
            if (!apiModel) {
                if (errorBlock) {
                    errorBlock(apiModel,999);
                }
                return ;
            }
            
            if (apiModel.code.integerValue == 0) {
                !block?:block(apiModel);
            }else{
                if (apiModel.code.integerValue == -2) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:LGLoginErrorNotification object:nil userInfo:@{@"statecode":apiModel.code}];
                }
                
                !errorBlock?:errorBlock(apiModel,apiModel.code.integerValue);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (hudStyle != LGNetHUDStyleNone) {
                [LGProgressHUD hideHUD];
            }
            NSLog(@"error = %@",error.description);
            !errorBlock?:errorBlock(nil,error.code);
        }];
    }
}

- (LGApiModel *)handleResponse:(id)responseObject autoShowError:(BOOL)autoShowError urlStr:(NSString *)urlStr{
     NSDictionary *dic = [NSDictionary dictionary];
     if ([responseObject isKindOfClass:[NSDictionary class]]) {
          dic = responseObject;
     }else if ([responseObject isKindOfClass:[NSData class]]){
          dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers |NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments error:nil];
          NSString *infoStr = [[NSString alloc]initWithData:responseObject encoding:4];
         NSLog(@"data01 -- %@",infoStr);
          if ([dic isKindOfClass:[NSDictionary class]]==NO) {
               NSString *infoStr = [[NSString alloc]initWithData:responseObject encoding:4];
              NSLog(@"data02 -- %@",infoStr);
               return nil;
          }
     }else{
          return nil;
     }
     LGApiModel *apiModel = [LGApiModel mj_objectWithKeyValues:dic];
     if (apiModel.code.integerValue != 0 && apiModel.code.integerValue != -2) {
        [LGProgressHUD showTipMessageInWindow:apiModel.msg];
     }
     return apiModel;
}
@end

@implementation LGApiModel
+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"code":@"cruelly",@"msg":@"saintly",@"data":@"wise"};
}
@end
