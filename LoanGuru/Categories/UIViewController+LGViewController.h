//
//  UIViewController+YBViewController.h
//  AFNetworking
//
//  Created by LQ on 2018/7/17.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LGViewController)

@property (nonatomic ,strong) NSDictionary *routeArguments;

+ (UIViewController *)topViewController;

@end
