//
//  WeakScriptMessageHandler.h
//  youonBikePlanA
//
//  Created by karry on 2020/8/3.
//  Copyright © 2020 audi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

typedef void(^WebViewReceiveScriptMessageBlock)(WKScriptMessage *message,NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface WeakScriptMessageHandler : NSObject<WKScriptMessageHandler>

@property (nonatomic,strong) NSMutableDictionary *handlers;

@property (nonatomic, weak) WKWebView *webView;

- (void)addName:(NSString *)name receiveMessage:(WebViewReceiveScriptMessageBlock)block;


@end

NS_ASSUME_NONNULL_END
