//
//  LGMainRouteRegister.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "LGMainRouteRegister.h"
#import "LGLoginViewController.h"
#import "LGSetViewController.h"
#import "LGHomePageViewController.h"
#import "LGRepayViewController.h"
#import "LGInfoAuthHomePageViewController.h"
#import "AppDelegate.h"
@implementation LGMainRouteRegister
+ (void)load{
    [LGModuleManager registerAppdelegateModule:self.class];
}


+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return YES;
}

-(void)enroll{
    [LGRoutes.globalRoutes addRoute:@"/login" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate goToLoginPage];
        return YES;
    }];
    
    [LGRoutes.globalRoutes addRoute:@"/main" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate goToHomePage];
        return YES;
    }];
    
    [LGRoutes.globalRoutes addRoute:@"/setting" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        LGSetViewController *setVC = [[LGSetViewController alloc] init];
        [[UIViewController topViewController].navigationController pushViewController:setVC animated:YES];
        return YES;
    }];
    
    [LGRoutes.globalRoutes addRoute:@"/order" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSString *tab = [parameters jk_stringForKey:@"tab"];
        NSLog(@"tab === %@",tab);
        return YES;
    }];
    
    [LGRoutes.globalRoutes addRoute:@"/productDetail" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSString *product_id = [parameters jk_stringForKey:@"product_id"];
        NSLog(@"product_id === %@",product_id);
        return YES;
    }];
}
@end
