//
//  LGNavigationController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/24.
//

#import "LGNavigationController.h"
#import "AppDelegate.h"
@interface LGNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LGNavigationController
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if ( self = [super initWithRootViewController:rootViewController]) {
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.delegate = self;
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    return self;
}

+ (void)initialize{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[UIImage jk_imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setShadowImage:[UIImage new]];
    
    [navigationBarAppearance setTintColor:[UIColor blackColor]];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                                     NSForegroundColorAttributeName:[UIColor blackColor],
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    if (@available(iOS 15.0, *)) {
          UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
          [appearance setBackgroundColor:[UIColor whiteColor]];
          appearance.shadowColor = [UIColor clearColor];
          [appearance setShadowImage:[UIImage new]];
          appearance.titleTextAttributes = @{
               NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
               NSForegroundColorAttributeName:[UIColor blackColor],
               };
          [[UINavigationBar appearance] setScrollEdgeAppearance: appearance];
          [[UINavigationBar appearance] setStandardAppearance:appearance];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.modalPresentationStyle = 0;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.viewControllers.count != 1 && [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return self.viewControllers.count != 1 && [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

#pragma mark - UIViewControllerRotation
- (BOOL)shouldAutorotate{
    if ([self.topViewController isKindOfClass:NSClassFromString(@"UIViewLive")]) {
        return [self.topViewController shouldAutorotate];
    }
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return app.isAutoRotation;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if ([self.topViewController isKindOfClass:NSClassFromString(@"UIViewLive")]) {
        return [self.topViewController supportedInterfaceOrientations];
    } else {
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        return app.isAutoRotation ?
        (UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortrait):
        UIInterfaceOrientationMaskPortrait;
    }
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return  UIInterfaceOrientationPortrait;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count>0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self backBtn]];
        if([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = YES;
            self.interactivePopGestureRecognizer.delegate = self;
        }
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    if (self.viewControllers.count == 1) {
       viewController.hidesBottomBarWhenPushed = YES;
     } else {
       viewController.hidesBottomBarWhenPushed = NO;
     }
    
    [super pushViewController:viewController animated:animated];
}
    
- (void)hidenBackBtn{
    self.topViewController.navigationItem.leftBarButtonItem = nil;
    self.topViewController.navigationItem.hidesBackButton = YES;
}
    
- (void)showBackBtn{
    self.topViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self backBtn]];
}
    
- (UIButton *)backBtn{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    button.jk_size = CGSizeMake(30, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark BackBtn M
- (void)goBack{
    [self popViewControllerAnimated:YES];
}
@end
