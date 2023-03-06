//
//  LGWebViewController.h
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef void(^WebViewReceiveScriptMessageBlock)(WKScriptMessage *message,NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface LGWebViewController : UIViewController

@property (nonatomic,strong) WKWebView *webView;

- (instancetype)initWithURL:(NSString *)URL;
@end


@interface LGWKProcessPool : WKProcessPool

+ (LGWKProcessPool*)singleWkProcessPool;

@end
NS_ASSUME_NONNULL_END
