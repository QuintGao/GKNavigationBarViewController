//
//  GKNavigationBarConfigure.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 高坤. All rights reserved.
//  https://github.com/QuintGao/GKNavigationBarViewController.git

#import "GKNavigationBarConfigure.h"
#import "UIViewController+GKCategory.h"

@interface GKNavigationBarConfigure()

@property (nonatomic, assign) CGFloat navItemLeftSpace;
@property (nonatomic, assign) CGFloat navItemRightSpace;

@end

@implementation GKNavigationBarConfigure

static GKNavigationBarConfigure *instance = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [GKNavigationBarConfigure new];
    });
    return instance;
}

// 设置默认的导航栏外观
- (void)setupDefaultConfigure {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleColor      = [UIColor blackColor];
    
    self.titleFont       = [UIFont boldSystemFontOfSize:17.0];
    
    self.statusBarHidden = NO;
    
    self.statusBarStyle  = UIStatusBarStyleDefault;
    
    self.backStyle       = GKNavigationBarBackStyleBlack;
    
    self.gk_navItemLeftSpace    = 0;
    self.gk_navItemRightSpace   = 0;
    
    self.navItemLeftSpace       = 0;
    self.navItemRightSpace      = 0;
    
    self.gk_snapMovementSensitivity = 0.7f;
    self.gk_pushTransitionCriticalValue = 0.3f;
    self.gk_popTransitionCriticalValue  = 0.5f;
    
    self.gk_translationX = 5.0f;
    self.gk_translationY = 5.0f;
    self.gk_scaleX = 0.95f;
    self.gk_scaleY = 0.97f;
}

- (void)setGk_navItemLeftSpace:(CGFloat)gk_navItemLeftSpace {
    _gk_navItemLeftSpace = gk_navItemLeftSpace;
}

- (void)setGk_navItemRightSpace:(CGFloat)gk_navItemRightSpace {
    _gk_navItemRightSpace = gk_navItemRightSpace;
}

- (void)setupCustomConfigure:(void (^)(GKNavigationBarConfigure *))block {
    [self setupDefaultConfigure];
    
    !block ? : block(self);
    
    self.navItemLeftSpace  = self.gk_navItemLeftSpace;
    self.navItemRightSpace = self.gk_navItemRightSpace;
}

// 更新配置
- (void)updateConfigure:(void (^)(GKNavigationBarConfigure *configure))block {
    !block ? : block(self);
}

- (UIViewController *)visibleViewController {
    return [[GKConfigure getKeyWindow].rootViewController gk_visibleViewControllerIfExist];
}

- (UIEdgeInsets)gk_safeAreaInsets {
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if ([GKConfigure gk_isNotchedScreen]) {
        UIWindow *keyWindow = [GKConfigure getKeyWindow];
        if (keyWindow) {
            if (@available(iOS 11.0, *)) {
                safeAreaInsets = keyWindow.safeAreaInsets;
            }
        }else { // 如果获取到的window是空
            // 对于刘海屏，当window没有创建的时候，可根据状态栏设置安全区域顶部高度
            // iOS14之后顶部安全区域不再是固定的44，所以修改为以下方式获取
            safeAreaInsets = UIEdgeInsetsMake([GKConfigure gk_statusBarFrame].size.height, 0, 34, 0);
        }
    }
    return safeAreaInsets;
}

- (CGRect)gk_statusBarFrame {
    CGRect statusBarFrame = CGRectZero;
    if (@available(iOS 13.0, *)) {
        statusBarFrame = [GKConfigure getKeyWindow].windowScene.statusBarManager.statusBarFrame;
    }
    
    if (CGRectEqualToRect(statusBarFrame, CGRectZero)) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
#pragma clang diagnostic pop
    }
    
    if (CGRectEqualToRect(statusBarFrame, CGRectZero)) {
        CGFloat statusBarH = [GKConfigure gk_isNotchedScreen] ? 44 : 20;
        statusBarFrame = CGRectMake(0, 0, GK_SCREEN_WIDTH, statusBarH);
    }
    
    return statusBarFrame;
}

static NSInteger isNotchedScreen = -1;
- (BOOL)gk_isNotchedScreen {
    if (isNotchedScreen < 0) {
        if (@available(iOS 11.0, *)) {
            UIWindow *keyWindow = [GKConfigure getKeyWindow];
            if (keyWindow) {
                isNotchedScreen = keyWindow.safeAreaInsets.bottom > 0 ? 1 : 0;
            }
        }
        
        // 当iOS11以下或获取不到keyWindow时用以下方案
        if (isNotchedScreen < 0) {
            CGSize screenSize = UIScreen.mainScreen.bounds.size;
            BOOL _isNotchedSize = (CGSizeEqualToSize(screenSize, CGSizeMake(375, 812)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(812, 375)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(414, 896)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(896, 414)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(390, 844)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(844, 390)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(428, 926)) ||
                                  CGSizeEqualToSize(screenSize, CGSizeMake(926, 428)));
            isNotchedScreen = _isNotchedSize ? 1 : 0;
        }
    }
    return isNotchedScreen > 0;
}

- (CGFloat)gk_fixedSpace {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    // 经测试发现iPhone 12和iPhone 12 Pro，默认导航栏间距是16，需要单独处理
    CGFloat deviceWidth = MIN(screenSize.width, screenSize.height);
    CGFloat deviceHeight = MAX(screenSize.width, screenSize.height);
    if (deviceWidth == 390.0f && deviceHeight == 844.0f) return 16;
    return deviceWidth > 375.0f ? 20 : 16;
}

- (BOOL)isVelocityInSensitivity:(CGFloat)velocity {
    return (fabs(velocity) - (1000.0f * (1 - self.gk_snapMovementSensitivity))) > 0;
}

- (UIWindow *)getKeyWindow {
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *w in windowScene.windows) {
                    if (window.isKeyWindow) {
                        window = w;
                        break;
                    }
                }
            }
        }
    }
    // 没有获取到window
    if (!window) {
        for (UIWindow *w in [UIApplication sharedApplication].windows) {
            if (w.isKeyWindow) {
                window = w;
                break;
            }
        }
    }
    return window;
}

@end
