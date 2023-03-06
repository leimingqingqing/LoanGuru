//
//  LGProgressHUD.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "LGProgressHUD.h"
#import <objc/runtime.h>
@interface LGProgressHUD()
{
    NSTimer *_timeOutTimer;
}
@end

@implementation LGProgressHUD
+ (LGProgressHUD *)createHUDWithMessage:(NSString *)msg isWindow:(BOOL)isWindow single:(BOOL)single{
    UIApplication *app = [UIApplication sharedApplication];
    UIView *view;
    if (isWindow) {
        view = app.delegate.window;
    }else{
        id objc = [self getCurrentVC];
        if ([objc respondsToSelector:@selector(view)]) {
            view = [objc view];
        }else{
            view = app.delegate.window;
        }
    }
    
    if (!view) {
        return nil;
    }
    LGProgressHUD *hud;
    if (single) {
        hud = [self hud];
        if (hud == nil) {
            hud = [self createDefaultHUDInView:view];
            objc_setAssociatedObject(app, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }else{
        hud = [self createDefaultHUDInView:view];
    }
    hud.detailsLabel.text = msg?msg:@"";
    [view addSubview:hud];
    [hud showAnimated:YES];
    return hud;
}

+ (instancetype)hud{
    UIApplication *app = [UIApplication sharedApplication];
    LGProgressHUD *hud = objc_getAssociatedObject(app, _cmd);
    return hud;
}

+ (LGProgressHUD *)createDefaultHUDInView:(UIView *)view{
    LGProgressHUD *hud = [[self alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.contentColor = [UIColor whiteColor];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
    hud.bezelView.alpha = 0.85;
    return hud;
}
#pragma mark-------------------- show tip ----------------------------
+ (instancetype)showTipMessageInWindow:(NSString*)message{
    if (message.length == 0) {
        return nil;
    }
    return [self showTipMessgae:message isWindow:YES timer:2.f];
}
+ (instancetype)showTipMessageInView:(NSString *)message{
    return [self showTipMessgae:message isWindow:NO timer:2.f];
}
+ (instancetype)showTipMessageInWindow:(NSString*)message timer:(int)aTimer{
    return [self showTipMessgae:message isWindow:YES timer:aTimer];
}
+ (instancetype)showTipMessageInView:(NSString *)message timer:(int)aTimer{
    return [self showTipMessgae:message isWindow:NO timer:aTimer];
}
+ (instancetype)showTipMessgae:(NSString *)message isWindow:(BOOL)isWindow timer:(int)aTimer{
    LGProgressHUD *hud = [self createHUDWithMessage:message isWindow:isWindow single:NO];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:aTimer];
    return hud;
}
#pragma mark-------------------- show Activity----------------------------
+ (instancetype)showActivityMessageInWindow:(NSString*)message{
    return [self showActivityMessage:message isWindow:YES timer:0];
}
+ (instancetype)showActivityMessageInView:(NSString*)message{
    return [self showActivityMessage:message isWindow:NO timer:0];
}
+ (instancetype)showActivityMessage:(NSString *)message isWindow:(BOOL)isWindow timer:(int)aTimer{
    LGProgressHUD *hud = [self createHUDWithMessage:message isWindow:isWindow single:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.userInteractionEnabled = YES;
    hud.graceTime = 0.5f;
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:aTimer];
    }
    return hud;
}
#pragma mark-------------------- showState ----------------------------
+ (void)showSuccessMessage:(NSString *)Message{
    [self showCustomIconInWindow:@"" message:Message];
}
+ (void)showErrorMessage:(NSString *)Message{
    [self showCustomIconInWindow:@"" message:Message];
}
+ (void)showInfoMessage:(NSString *)Message{
    [self showCustomIconInWindow:@"" message:Message];
}
+ (void)showWarnMessage:(NSString *)Message{
    [self showCustomIconInWindow:@"" message:Message];
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message{
    [self showCustomIcon:iconName message:message isWindow:true];
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message{
    [self showCustomIcon:iconName message:message isWindow:false];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow{
    LGProgressHUD *hud = [self createHUDWithMessage:message isWindow:isWindow single:NO];
    UIImage *image = [UIImage imageNamed:@""];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.mode = MBProgressHUDModeCustomView;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:2.f];
}
#pragma mark-------------------- override ----------------------------
- (void)showAnimated:(BOOL)animated{
    if (_timeOutTimer) {
        [_timeOutTimer invalidate];
        _timeOutTimer = nil;
    }
    _timeOutTimer = [NSTimer timerWithTimeInterval:20.f target:self selector:@selector(timeout) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop]addTimer:_timeOutTimer forMode:NSRunLoopCommonModes];
    [super showAnimated:animated];
}
- (void)timeout{
    [self removeFromSuperview];
}
- (void)removeFromSuperview{
    [super removeFromSuperview];
    if (_timeOutTimer) {
        [_timeOutTimer invalidate];
        _timeOutTimer = nil;
    }
}
+ (void)hideHUD{
    UIView *winView =(UIView *)[UIApplication sharedApplication].delegate.window;
    [self hideActivityHUDForView:winView animated:YES];
    
    UIView *view;
    id objc = [self getCurrentVC];
    if ([objc respondsToSelector:@selector(view)]) {
        view = [objc view];
        [self hideActivityHUDForView:view animated:YES];
    }
}

+ (void)hideActivityHUDForView:(UIView *)view animated:(BOOL)animated{
    LGProgressHUD *hud = (LGProgressHUD *)[self HUDForView:view];
    if (hud.mode != MBProgressHUDModeIndeterminate) {
        return;
    }
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:animated];
    }
}

#pragma mark-------------------- tool ----------------------------
+ (UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        result=nav.childViewControllers.lastObject;
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}

@end
