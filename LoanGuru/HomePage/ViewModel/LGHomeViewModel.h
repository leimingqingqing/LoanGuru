//
//  LGHomeViewModel.h
//  LoanGuru
//
//  Created by Apple on 2023/3/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGHomeViewModel : NSObject
+(NSURLSessionDataTask *_Nullable)getHomeInfoSuccess:(nonnull callbackSuccess)success
                                                fail:(nullable callbackFail)fail;
@end

NS_ASSUME_NONNULL_END
