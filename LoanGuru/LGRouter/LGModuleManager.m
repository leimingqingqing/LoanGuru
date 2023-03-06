//
//  YBModuleManager.m
//  AFNetworking
//
//  Created by LQ on 2018/8/1.
//

#import "LGModuleManager.h"
static NSMutableArray <Class> *moduleClasses;
@implementation LGModuleManager

+ (void)registerAppdelegateModule:(Class)moduleClass{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moduleClasses = [NSMutableArray array];
    });
    if(![moduleClasses containsObject:moduleClass]){
        [moduleClasses addObject:moduleClass];
    }
}

+ (void)hookAppDelegate:(id<UIApplicationDelegate>)delegate{
    Class delegateClass = [delegate class];
    if(!delegateClass){
        return;
    }
}
@end
