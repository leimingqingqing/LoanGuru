//
//  YBRouteRegister.m
//  AFNetworking
//
//  Created by LQ on 2018/7/17.
//

#import "LGRouteRegister.h"
#import "LGRoutes.h"
#import "LGRouterConfig.h"
#import "LGWebViewController.h"
#import "LGModuleManager.h"
@implementation LGRouteRegister

+ (void)load{
    [LGModuleManager registerAppdelegateModule:self.class];
}

+ (void)enroll:(NSArray<__kindof NSString*>*)modules{
    NSMutableArray *allModules = [NSMutableArray array];
    [allModules addObject:@"LGRouteRegister"];
    [allModules addObjectsFromArray:modules];
    for (int i = 0; i < allModules.count; i++) {
        Class cls = NSClassFromString(allModules[i]);
        id r = [cls new];
        if ([r conformsToProtocol:@protocol(LGRouteRegisterProtocol)]) {
            [r enroll];
        }
    }
}

- (void)enroll {
    [LGRoutes.globalRoutes addRoute:@"/push/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self push:parameters];
    }];
    
    [LGRoutes.globalRoutes addRoute:@"/present/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self present:parameters];
    }];

    [LGRoutes.globalRoutes addRoute:@"/html/:fileName" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        NSString *fileName = parameters[@"fileName"];
        if(!fileName || fileName.length == 0){
            return NO;
        }
        NSString *filePath = [NSBundle.mainBundle pathForResource:fileName ofType:@"html"];
        NSURL *URL = [NSURL fileURLWithPath:filePath];
        NSString *url = URL.absoluteString;
        [self pushToWebViewWithUrlStr:url];
        return YES;
    }];
    
    LGRoutes.globalRoutes.unmatchedURLHandler = ^(JLRoutes * _Nonnull routes, NSURL * _Nullable URL, NSDictionary<NSString *,id> * _Nullable parameters) {
        NSString *urlStr;
        if([URL.scheme isEqualToString:LGHttpRouteSchema]){
           urlStr = [@"http:"stringByAppendingString:URL.resourceSpecifier];
            [self pushToWebViewWithUrlStr:urlStr];
        }
        else if([URL.scheme isEqualToString:LGHttpsRouteSchema]){
           urlStr = [@"https:"stringByAppendingString:URL.resourceSpecifier];
            [self pushToWebViewWithUrlStr:urlStr];
        }else if ([URL.scheme isEqualToString:@"https"] || [URL.scheme isEqualToString:@"http"]){
            [self pushToWebViewWithUrlStr:URL.absoluteString];
        }
    };
    
}

- (BOOL)push:(NSDictionary <NSString *,id> *)parameters{
    Class cls = NSClassFromString(parameters[@"controller"]);
    if (!cls) {
        return NO;
    }
    UIViewController *vc = [cls new];
    vc.routeArguments = parameters;
    [[UIViewController topViewController].navigationController pushViewController:vc animated:YES];
    return YES;
}

- (BOOL)present:(NSDictionary <NSString *,id> *)parameters{
    Class cls = NSClassFromString(parameters[@"controller"]);
    if (!cls) {
        return NO;
    }
    UIViewController *vc = [cls new];
    vc.routeArguments = parameters;
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:nil];
    return YES;
}

- (void)pushToWebViewWithUrlStr:(NSString *)urlStr{
    LGWebViewController *vc = [[LGWebViewController alloc]initWithURL:urlStr];
    UIViewController *top = [UIViewController topViewController];
    if (top && top.navigationController) {
        [top.navigationController pushViewController:vc animated:YES];
    }
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if ([url.scheme isEqualToString:LGDefaultRouteSchema]
        || [url.scheme isEqualToString:LGHttpRouteSchema]
        || [url.scheme isEqualToString:LGHttpsRouteSchema]) {
        [LGRoutes.globalRoutes routeURL:url];
    }
    return YES;
}

@end
