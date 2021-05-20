//
//  GKDemo005ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2021/4/6.
//  Copyright © 2021 QuintGao. All rights reserved.
//

#import "GKDemo005ViewController.h"
#import <WebKit/WebKit.h>

@interface GKDemo005ViewController()<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation GKDemo005ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gk_navigationBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:NULL];
    
//    NSString *url = @"https://www.baidu.com";
    NSString *url = @"http://www.qukanvideo.com/cloud/h5/1609067279049903";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
}

#pragma mark - GKGesturePopHandlerProtocol
- (BOOL)popGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"title"]) {
        self.gk_navTitle = self.webView.title;
    }else if ([keyPath isEqualToString:@"canGoBack"]) {
        if ([self.webView canGoBack]) {
            self.gk_interactivePopDisabled = YES;
        }else {
            self.gk_interactivePopDisabled = NO;
        }
    }
}

#pragma mark - 懒加载
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.allowsBackForwardNavigationGestures = YES;
    }
    return _webView;
}

@end
