//
//  YBRoutes.m
//  AFNetworking
//
//  Created by LQ on 2018/7/17.
//

#import "LGRoutes.h"
#import "LGRouterConfig.h"

@implementation LGRoutes
+ (void)openURL:(NSString *)URL{
    NSURL *myUrl = [NSURL URLWithString:URL];
    if ([myUrl.scheme isEqualToString:@"https"]) {
        URL = [@"LGHttps:" stringByAppendingString:myUrl.resourceSpecifier];
    }else if ([myUrl.scheme isEqualToString:@"http"]){
        URL = [@"LGHttp:" stringByAppendingString:myUrl.resourceSpecifier];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL] options:[NSDictionary new] completionHandler:nil];
}
@end
