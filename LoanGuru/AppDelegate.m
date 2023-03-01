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
    
    [self goToLoginPage];
    return YES;
}

-(void)goToLoginPage{
    LGNavigationController *nav = [[LGNavigationController alloc] initWithRootViewController:[LGLoginViewController new]];
    self.window.rootViewController = nav;
}

-(void)goToHomePage{
    LGTabbarController *tabBarViewController = [[LGTabbarController alloc] init];
    
    LGHomePageViewController *homePageVC = [[LGHomePageViewController alloc] init];
    
    [tabBarViewController addChildViewController:homePageVC title:@"LOAN" imageName:@"loan_normal" selectedImageName:@"loan_selected"];
    
    LGRepayViewController *repayVC = [[LGRepayViewController alloc] init];
    [tabBarViewController addChildViewController:repayVC title:@"REPAY" imageName:@"repay_normal" selectedImageName:@"repay_selected"];
    
    LGAccountViewController *accountVC = [[LGAccountViewController alloc] init];
    [tabBarViewController addChildViewController:accountVC title:@"ACCOUNT" imageName:@"account_normal" selectedImageName:@"account_selected"];
    
    self.window.rootViewController = tabBarViewController;
    self.tabBarViewController = tabBarViewController;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
@end
