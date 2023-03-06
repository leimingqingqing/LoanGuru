//
//  UIApplication+hook.m
//  AFNetworking
//
//  Created by 李鹏程 on 2018/8/1.
//

#import "UIApplication+hook.h"
#import "JKCategories.h"

@implementation UIApplication (hook)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.class jk_swizzleMethod:@selector(setDelegate:) withMethod:@selector(hook_setDelegate:)];
    });
}

- (void)hook_setDelegate:(id<UIApplicationDelegate>)delegate{
    [self hook_setDelegate:delegate];
    [LGModuleManager hookAppDelegate:delegate];
}

@end
