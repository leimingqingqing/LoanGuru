//
//  WeakScriptMessageHandler.m
//  youonBikePlanA
//
//  Created by karry on 2020/8/3.
//  Copyright © 2020 audi. All rights reserved.
//

#import "WeakScriptMessageHandler.h"
@interface WeakScriptMessageHandler()

@end

@implementation WeakScriptMessageHandler

- (instancetype)init{
    if (self = [super init]) {
        _handlers = [NSMutableDictionary dictionary];
        [self setupJsHandle];
    }
    return self;
}

- (void)addName:(NSString *)name receiveMessage:(WebViewReceiveScriptMessageBlock)block{
    if (!name || name.length == 0) {
        NSError *error = [NSError errorWithDomain:@"name不能为空" code:111 userInfo:nil];
        block(nil,error);
        return;
    }
    _handlers[name] = block;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSString *key = message.name;
    if (!key) {
        NSLog(@"js error");
        return;
    }
    WebViewReceiveScriptMessageBlock block = _handlers[key];
    !block?:block(message,nil);
}

- (void)setupJsHandle{
    @weakify(self)
    [self addName:@"getSessionId" receiveMessage:^(WKScriptMessage *message, NSError *error) {
        NSLog(@"%@",message.body);
        NSString *javaScript = [NSString stringWithFormat:@"getSessionId('%@')",@"test"];
        [message.webView evaluateJavaScript:javaScript completionHandler:^(id _Nullable script, NSError * _Nullable error) {
            NSLog(@"上传sessionId成功");
        }];
    }];
    
    [self addName:@"getVersion" receiveMessage:^(WKScriptMessage *message, NSError *error) {
        NSLog(@"%@",message.body);
        NSString *versionStr = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *currentAppVersion = versionStr;
        NSString *javaScript = [NSString stringWithFormat:@"getVersion('%@')",currentAppVersion];
        [message.webView evaluateJavaScript:javaScript completionHandler:^(id _Nullable script, NSError * _Nullable error) {
            NSLog(@"上传version成功");
        }];
    }];
    
    [self addName:@"openUrl" receiveMessage:^(WKScriptMessage *message, NSError *error) {
        [LGRoutes openURL:message.body];
    }];
}
@end
