//
//  LGProgressHUD.h
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface LGProgressHUD : MBProgressHUD
+ (instancetype)showTipMessageInWindow:(NSString*)message;
+ (instancetype)showTipMessageInView:(NSString *)message;
+ (instancetype)showTipMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (instancetype)showTipMessageInView:(NSString *)message timer:(int)aTimer;
+ (instancetype)showActivityMessageInWindow:(NSString*)message;
+ (instancetype)showActivityMessageInView:(NSString*)message;
+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showInfoMessage:(NSString *)Message;
+ (void)showWarnMessage:(NSString *)Message;
+ (void)hideHUD;
@end

NS_ASSUME_NONNULL_END
