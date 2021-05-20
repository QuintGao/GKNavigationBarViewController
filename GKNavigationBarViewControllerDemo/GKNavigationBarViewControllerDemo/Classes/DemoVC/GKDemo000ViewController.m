//
//  GKDemo000ViewController.m
//  GKNavigationBarExample
//
//  Created by QuintGao on 2020/4/6.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKDemo000ViewController.h"
#import "GKDemoWebViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface GKDemo000ViewController ()<GKViewControllerPushDelegate, GKViewControllerPopDelegate>

@property (weak, nonatomic) IBOutlet UILabel *interactivePopLabel;
@property (weak, nonatomic) IBOutlet UISwitch *interactivePopSwitch;
@property (weak, nonatomic) IBOutlet UILabel *fullScreenPopLabel;
@property (weak, nonatomic) IBOutlet UISwitch *fullScreenPopSwitch;
@property (weak, nonatomic) IBOutlet UILabel *statusBarStyleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *statusBarStyleSwitch;
@property (weak, nonatomic) IBOutlet UILabel *statusBarHiddenLabel;
@property (weak, nonatomic) IBOutlet UISwitch *statusBarHiddenSwitch;
@property (weak, nonatomic) IBOutlet UILabel *navBackgroundLabel;
@property (weak, nonatomic) IBOutlet UISwitch *navBackgroundSwitch;
@property (weak, nonatomic) IBOutlet UILabel *navLineHiddenLabel;
@property (weak, nonatomic) IBOutlet UISwitch *navLineHiddenSwitch;
@property (weak, nonatomic) IBOutlet UILabel *backStyleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *backStyleSwitch;
@property (weak, nonatomic) IBOutlet UILabel *leftPushLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftPushSwitch;
@property (weak, nonatomic) IBOutlet UILabel *moreItemLabel;
@property (weak, nonatomic) IBOutlet UISwitch *moreItemSwitch;

@property (weak, nonatomic) IBOutlet UILabel *fullScreenInterceptLabel;
@property (weak, nonatomic) IBOutlet UISwitch *fullScreenInterceptSwitch;

@property (weak, nonatomic) IBOutlet UILabel *fullScreenDistanceLabel;
@property (weak, nonatomic) IBOutlet UISlider *fullScreenDistanceSlider;
@property (weak, nonatomic) IBOutlet UILabel *navBarAlphaLabel;
@property (weak, nonatomic) IBOutlet UISlider *navBarAlphaSlider;

@property (nonatomic, strong) UIBarButtonItem *moreItem;
@property (nonatomic, strong) UIBarButtonItem *shareItem;

// 是否禁止返回
@property (nonatomic, assign) BOOL disableBack;

@end

@implementation GKDemo000ViewController

- (instancetype)init {
    if (self = [super init]) {
        self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置默认样式
    self.gk_navTitle = @"Demo";
    self.gk_navTitleColor = [UIColor whiteColor];
    self.gk_navBackgroundColor = [UIColor redColor];
    self.gk_navShadowColor = [UIColor blackColor];
    self.gk_backStyle = GKNavigationBarBackStyleWhite;
    self.gk_navItemRightSpace = 30;
    self.gk_navRightBarButtonItem = self.moreItem;
    
    self.leftPushSwitch.on = NO;
    self.moreItemSwitch.on = NO;
    self.fullScreenInterceptSwitch.on = NO;
    self.fullScreenDistanceSlider.minimumValue = 0;
    self.fullScreenDistanceSlider.maximumValue = self.view.frame.size.width;
    if (self.gk_popMaxAllowedDistanceToLeftEdge == 0) {
        self.fullScreenDistanceSlider.value = self.view.frame.size.width;
    }
    self.fullScreenDistanceLabel.text = [NSString stringWithFormat:@"全屏返回手势距离：%f", self.gk_popMaxAllowedDistanceToLeftEdge];
    self.navBarAlphaSlider.value = self.gk_navBarAlpha;
    self.navBarAlphaLabel.text = [NSString stringWithFormat:@"导航栏透明度：%f", self.gk_navBarAlpha];
    
    self.gk_systemGestureHandleDisabled = YES;
    self.gk_popDelegate = self;
    
    UIViewController *vc = [UIViewController new];
    [self addChildViewController:vc];
    vc.view.userInteractionEnabled = NO;
    [self.view addSubview:vc.view];
}

- (IBAction)interactivePopAction:(id)sender {
    self.gk_interactivePopDisabled = !self.interactivePopSwitch.on;
    
    self.interactivePopLabel.text = [NSString stringWithFormat:@"侧滑返回手势：%@", self.interactivePopSwitch.on ? @"开" : @"关"];
}

- (IBAction)fullScreenPopAction:(id)sender {
    self.gk_fullScreenPopDisabled = !self.fullScreenPopSwitch.on;
    
    self.fullScreenDistanceLabel.text = [NSString stringWithFormat:@"全屏返回手势：%@", self.fullScreenPopSwitch.on ? @"开" : @"关"];
}

- (IBAction)statusBarStyleAction:(id)sender {
    if (self.statusBarStyleSwitch.on) {
        self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    }else {
        if (@available(iOS 13.0, *)) {
            self.gk_statusBarStyle = UIStatusBarStyleDarkContent;
        } else {
            self.gk_statusBarStyle = UIStatusBarStyleDefault;
        }
    }
    self.statusBarStyleLabel.text = [NSString stringWithFormat:@"状态栏样式：%@", self.statusBarStyleSwitch.on ? @"LightContent" : @"Default"];
}

- (IBAction)statusBarHiddenAction:(id)sender {
    self.gk_statusBarHidden = !self.statusBarHiddenSwitch.on;
    
    self.statusBarHiddenLabel.text = [NSString stringWithFormat:@"状态栏显隐：%@", self.statusBarHiddenSwitch.on ? @"显示" : @"隐藏"];
}
- (IBAction)navBackgroundAction:(id)sender {
    if (self.navBackgroundSwitch.on) {
        self.gk_navBackgroundColor = [UIColor redColor];
    }else {
        self.gk_navBackgroundColor = [UIColor blueColor];
    }
    self.navBackgroundLabel.text = [NSString stringWithFormat:@"导航栏背景色：%@", self.navBackgroundSwitch.on ? @"红色" : @"蓝色"];
}
- (IBAction)navLineHiddenAction:(id)sender {
    self.gk_navLineHidden = !self.navLineHiddenSwitch.on;
    
    self.navLineHiddenLabel.text = [NSString stringWithFormat:@"导航栏分割线：%@", self.navLineHiddenSwitch.on ? @"显示" : @"隐藏"];
}
- (IBAction)backStyleAction:(id)sender {
    if (self.backStyleSwitch.on) {
        self.gk_backStyle = GKNavigationBarBackStyleWhite;
    }else {
        self.gk_backStyle = GKNavigationBarBackStyleBlack;
    }
}
- (IBAction)leftPushAction:(id)sender {
    if (self.leftPushSwitch.on) {
        self.gk_pushDelegate = self;
    }else {
        self.gk_pushDelegate = nil;
    }
    self.leftPushLabel.text = [NSString stringWithFormat:@"左滑push功能：%@", self.leftPushSwitch.on ? @"开" : @"关"];
}
- (IBAction)moreItemAction:(id)sender {
    if (self.moreItemSwitch.on) {
        self.gk_navRightBarButtonItems = @[self.shareItem, self.moreItem];
    }else {
        self.gk_navRightBarButtonItems = nil;
        self.gk_navRightBarButtonItem = self.moreItem;
    }
    self.moreItemLabel.text = [NSString stringWithFormat:@"多个导航按钮：%@", self.moreItemSwitch.on ? @"开" : @"关"];
}

- (IBAction)fullScreenInterceptAction:(id)sender {
    if (self.fullScreenInterceptSwitch.on) {
        self.disableBack = YES;
    }else {
        self.disableBack = NO;
    }
    self.fullScreenInterceptLabel.text = [NSString stringWithFormat:@"返回拦截：%@", self.fullScreenInterceptSwitch.on ? @"开" : @"关"];
}

- (IBAction)fullScreenDistanceAction:(id)sender {
    self.gk_popMaxAllowedDistanceToLeftEdge = self.fullScreenDistanceSlider.value;
    self.fullScreenDistanceLabel.text = [NSString stringWithFormat:@"全屏返回手势距离：%f", self.gk_popMaxAllowedDistanceToLeftEdge];
}
- (IBAction)navBarAlphaAction:(id)sender {
    self.gk_navBarAlpha = self.navBarAlphaSlider.value;
    self.navBarAlphaLabel.text = [NSString stringWithFormat:@"导航栏透明度：%f", self.gk_navBarAlpha];
}

- (void)moreClick {
    GKDemoWebViewController *webVC = [GKDemoWebViewController new];
    
    UINavigationController *nav = [UINavigationController rootVC:webVC];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 懒加载
- (UIBarButtonItem *)moreItem {
    if (!_moreItem) {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(0, 0, 44, 44);
        [btn setTitle:@"更多" forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor blackColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
        
        _moreItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _moreItem;
}

- (UIBarButtonItem *)shareItem {
    if (!_shareItem) {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(0, 0, 44, 44);
        [btn setTitle:@"分享" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _shareItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _shareItem;
}

#pragma mark - GKViewControllerPushDelegate
- (void)pushToNextViewController {
    GKDemoWebViewController *webVC = [GKDemoWebViewController new];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - GKGesturePopHandlerProtocol
- (BOOL)navigationShouldPop {
    if (self.disableBack) {
        [self showBackAlert];
    }
    return !self.disableBack;
}

- (void)showBackAlert {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定要返回吗？" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.disableBack = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
