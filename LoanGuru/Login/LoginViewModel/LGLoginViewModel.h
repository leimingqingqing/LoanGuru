//
//  LGLoginViewModel.h
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGLoginViewModel : NSObject
+(NSURLSessionDataTask *_Nullable)getVertifyCodeWithDeceived:(NSString * _Nonnull)deceived
                                               treacherously:(NSString * _Nonnull)treacherously
                                                       Success:(nonnull callbackSuccess)success
                                                          fail:(nullable callbackFail)fail;

+(NSURLSessionDataTask *_Nullable)loginWithActed:(NSString * _Nonnull)acted
                                       spectacle:(NSString * _Nonnull)spectacle
                                     interesting:(NSString * _Nonnull)interesting
                                         ashamed:(NSString * _Nonnull)ashamed
                                         Success:(nonnull callbackSuccess)success
                                            fail:(nullable callbackFail)fail;
@end

NS_ASSUME_NONNULL_END
