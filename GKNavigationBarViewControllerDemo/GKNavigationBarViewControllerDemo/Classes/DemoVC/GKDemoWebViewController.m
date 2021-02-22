//
//  GKDemoWebViewController.m
//  GKNavigationBarExample
//
//  Created by QuintGao on 2019/11/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDemoWebViewController.h"
#import <WebKit/WebKit.h>
#import "GKDemo001ViewController.h"

@interface GKDemoWebViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) UIBarButtonItem *backBtn;
@property (nonatomic, strong) UIBarButtonItem *closeBtn;

@end

@implementation GKDemoWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"WebView跳转";
    self.gk_navLeftBarButtonItem = self.backBtn;
    self.gk_navRightBarButtonItem = self.closeBtn;
    self.gk_navItemLeftSpace = 0;
    self.gk_navItemRightSpace = 0;
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.gk_navigationBar.mas_bottom);
    }];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"web" ofType:@"txt"];
    
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

- (void)jump {
//    GKDemo015ViewController *vc = [GKDemo015ViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        NSLog(@"跳转");
        
        GKDemo001ViewController *demo001VC = [GKDemo001ViewController new];
        [self.navigationController pushViewController:demo001VC animated:YES];
        
        decisionHandler(WKNavigationActionPolicyCancel);
        
    }else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)backItemClick:(id)sender {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 懒加载
- (WKWebView *)webView {
    if (!_webView) {
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";

        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];

        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        wkWebConfig.userContentController = wkUController;

        // 创建设置对象
        WKPreferences *preference = [[WKPreferences alloc]init];
        // 设置字体大小(最小的字体大小)
//        preference.minimumFontSize = 15;
        // 设置偏好设置对象
        wkWebConfig.preferences = preference;
        
        CGRect frame = CGRectMake(0, 0, GK_SCREEN_WIDTH, 0);
        
        WKWebView *webView = [[WKWebView alloc] initWithFrame:frame configuration:wkWebConfig];
        webView.scrollView.alwaysBounceVertical = NO;
        if (@available(iOS 11.0, *)) {
            webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        webView.navigationDelegate = self;
        
        _webView = webView;
    }
    return _webView;
}

- (UIBarButtonItem *)backBtn {
    if (!_backBtn) {
        UIButton *back = [UIButton new];
        back.frame = CGRectMake(0, 0, 44, 44);
        [back setImage:[UIImage gk_imageNamed:@"btn_back_black"] forState:UIControlStateNormal];
        back.backgroundColor = [UIColor redColor];
        [back addTarget:self action:@selector(backItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _backBtn = [[UIBarButtonItem alloc] initWithCustomView:back];
    }
    return _backBtn;
}

- (UIBarButtonItem *)closeBtn {
    if (!_closeBtn) {
        UIButton *close = [UIButton new];
        close.frame = CGRectMake(0, 0, 44, 44);
        [close setTitle:@"关闭" forState:UIControlStateNormal];
        [close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        close.backgroundColor = [UIColor redColor];
        [close addTarget:self action:@selector(backItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [close addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn = [[UIBarButtonItem alloc] initWithCustomView:close];
    }
    return _closeBtn;
}

@end
