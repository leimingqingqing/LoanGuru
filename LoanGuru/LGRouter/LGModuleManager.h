//
//  YBModuleManager.h
//  AFNetworking
//
//  Created by 李鹏程 on 2018/8/1.
//

#import <Foundation/Foundation.h>

@interface LGModuleManager : NSObject

+ (void)registerAppdelegateModule:(Class)moduleClass;
+ (void)hookAppDelegate:(id<UIApplicationDelegate>)delegate;
@end
