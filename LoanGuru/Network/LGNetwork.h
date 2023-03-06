//
//  LGNetwork.h
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#define LGNET [LGNetwork shareNet]

#import "AFHTTPSessionManager.h"

@class LGApiModel;

typedef void (^callbackSuccess)(LGApiModel * _Nullable dataModel);
typedef void (^callbackFail)(LGApiModel * _Nullable dataModel, NSInteger errorCode);
typedef NS_ENUM(NSInteger,YBNetHUDStyle){
    LGNetHUDStyleNone = 0,
    LGNetHUDStyleOnView,
    LGNetHUDStyleOnWindow
};

NS_ASSUME_NONNULL_BEGIN

@interface LGNetwork : AFHTTPSessionManager

+ (instancetype)shareNet;


- (NSURLSessionDataTask *)yb_post:(NSString *)path
                           params:(NSString *)paramsStr
                            ifGet:(BOOL)ifGet
                    autoShowError:(BOOL)autoShowError
                         hudStyle:(YBNetHUDStyle)hudStyle
                           hudMsg:(NSString *)hudMsg
                        backBlock:(void(^)(LGApiModel *dataModel))block
                       errorBlock:(void(^)(LGApiModel *dataModel,NSInteger errorCode))errorBlock;

@end

@interface LGApiModel : NSObject
@property (nonatomic ,copy)NSString *code;
@property (nonatomic ,copy)NSString *msg;
@property (nonatomic ,strong)id data;
@end
NS_ASSUME_NONNULL_END
