//
//  AppDelegate.m
//  LoanGuru
//
//  Created by Apple on 2023/2/24.
//

#import "AppDelegate.h"
#import "LGLoginViewController.h"
#import "LGNavigationController.h"
#import "LGTabbarController.h"
#import "LGHomePageViewController.h"
#import "LGRepayViewController.h"
#import "LGAccountViewController.h"
#import "LGTokenSettingAndGetting.h"
@interface AppDelegate ()
@property (nonatomic, strong)LGTabbarController *tabBarViewController;
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.isAutoRotation = NO;

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UIViewController new];
    [self.window makeKeyAndVisible];
    
    [LGRouteRegister enroll:@[@"LGMainRouteRegister"]];
    
    NSString *sessionId = [LGTokenSettingAndGetting getSessionId];
    if(sessionId.length > 0){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self goToHomePage];
        });
    }else{
        [self goToLoginPage];
    }
    return YES;
}

-(void)goToLoginPage{
    UIViewController *topViewController = [UIViewController topViewController];
    if([topViewController isKindOfClass:[LGLoginViewController class]]){
        return;
    }
    LGNavigationController *nav = [[LGNavigationController alloc] initWithRootViewController:[LGLoginViewController new]];
    self.window.rootViewController = nav;
}

-(void)goToHomePage{
    UIViewController *topViewController = [UIViewController topViewController];
    if([topViewController isKindOfClass:[LGTabbarController class]]){
        [self.tabBarViewController setSelectedIndex:0];
        return;
    }
    
    LGTabbarController *tabBarViewController = [[LGTabbarController alloc] init];
    LGHomePageViewController *homePageVC = [[LGHomePageViewController alloc] init];
    
    [tabBarViewController addChildViewController:homePageVC title:@"LOAN" imageName:@"loan_normal" selectedImageName:@"loan_selected"];
    
    LGRepayViewController *repayVC = [[LGRepayViewController alloc] init];
    [tabBarViewController addChildViewController:repayVC title:@"REPAY" imageName:@"repay_normal" selectedImageName:@"repay_selected"];
    
    LGAccountViewController *accountVC = [[LGAccountViewController alloc] init];
    [tabBarViewController addChildViewController:accountVC title:@"ACCOUNT" imageName:@"account_normal" selectedImageName:@"account_selected"];
    
    [tabBarViewController setSelectedIndex:0];
    self.window.rootViewController = tabBarViewController;
    self.tabBarViewController = tabBarViewController;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    if ([url.scheme isEqualToString:LGDefaultRouteSchema]
        || [url.scheme isEqualToString:LGHttpRouteSchema]
        || [url.scheme isEqualToString:LGHttpsRouteSchema]) {
        [LGRoutes.globalRoutes routeURL:url];
    }
    return YES;
}
@end
