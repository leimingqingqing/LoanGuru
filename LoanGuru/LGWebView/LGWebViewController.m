//
//  LGWebViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "LGWebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WeakScriptMessageHandler.h"
@interface LGWebViewController ()<WKUIDelegate,WKNavigationDelegate>
{
    NSString *_url;
}
@property (nonatomic,strong) NSURLRequest *request;
@property (nonatomic, strong) WeakScriptMessageHandler *handler;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) UIBarButtonItem *backItem;
@end

@implementation LGWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_auth_blackArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = self.backItem;
    
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectZero configuration:[self baseConfig]];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    self.handler.webView = self.webView;
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 2)];
    self.progressView.progressTintColor = mainColor;
    self.progressView.trackTintColor = [UIColor clearColor];
    [self.view addSubview:self.progressView];
    
    _url = [_url urlAllowChinese];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:_url]];
    self.request = request;
    [self.webView loadRequest:self.request];
    
    @weakify(self)
    [RACObserve(self.webView,estimatedProgress)subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSNumber *num = (NSNumber *)x;
        if(num.floatValue >= 1.0){
            [self.progressView setProgress:0];
        }else{
            [self.progressView setProgress:num.floatValue animated:YES];
        }
    }];
    
    [RACObserve(self.webView, title) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.navigationItem.title = (NSString *)x;
    }];
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (instancetype)initWithURL:(NSString *)URL{
    if (self = [super init]) {
        _url = URL;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (WKWebViewConfiguration *)baseConfig{
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    config.preferences = [WKPreferences new];
    config.preferences.javaScriptEnabled = YES;
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    config.userContentController = [WKUserContentController new];
    [config.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];
     config.processPool  = [LGWKProcessPool singleWkProcessPool];
    
    self.handler = [[WeakScriptMessageHandler alloc] init];
    for (NSString *key in self.handler.handlers.allKeys) {
        [config.userContentController addScriptMessageHandler:self.handler name:key];
    }
    
     if (@available(iOS 10.0, *)) {
         config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
     } else {
         config.mediaTypesRequiringUserActionForPlayback = NO;
         config.allowsAirPlayForMediaPlayback = YES;
         config.mediaTypesRequiringUserActionForPlayback = NO;
     }
     config.allowsInlineMediaPlayback = YES;
     
     
    return config;
}

-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    NSLog(@"createWebViewWithConfiguration");
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *URL = navigationAction.request.URL;
    if ([URL.scheme isEqualToString:@"http"]||
        [URL.scheme isEqualToString:@"https"]||
        [URL.scheme isEqualToString:@"file"]) {
        decisionHandler(WKNavigationActionPolicyAllow);
    }else{
        if ([[UIApplication sharedApplication]canOpenURL:URL]) {
            [[UIApplication sharedApplication] openURL:URL options:[NSDictionary new] completionHandler:nil];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{

    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
           if ([challenge previousFailureCount] == 0) {
               NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
               completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
           } else {
               completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
           }
       } else {
           completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
       }
}
@end

@implementation LGWKProcessPool

+ (LGWKProcessPool*)singleWkProcessPool{
     static LGWKProcessPool * sharedPool;
     static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
          sharedPool = [[LGWKProcessPool alloc]  init];
     });
     return sharedPool;
}
@end
