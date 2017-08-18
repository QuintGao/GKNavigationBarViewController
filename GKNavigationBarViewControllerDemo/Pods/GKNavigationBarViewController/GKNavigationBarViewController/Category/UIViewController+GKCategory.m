//
//  UIViewController+GKCategory.m
//  GKCustomNavigationBar
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UIViewController+GKCategory.h"
#import "GKNavigationBarViewController.h"
#import <objc/runtime.h>

NSString *const GKViewControllerPropertyChangedNotification = @"GKViewControllerPropertyChangedNotification";

static const void* GKInteractivePopKey = @"GKInteractivePopKey";
static const void* GKFullScreenPopKey  = @"GKFullScreenPopKey";
static const void* GKPopMaxDistanceKey = @"GKPopMaxDistanceKey";
static const void* GKNavBarAlphaKey    = @"GKNavBarAlphaKey";
static const void* GKPushDelegateKey   = @"GKPushDelegateKey";

@implementation UIViewController (GKCategory)

// 使用static inline创建静态内联函数，方便调用
static inline void gk_swizzled_method(Class class ,SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL isAdd = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isAdd) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// 方法交换
+ (void)load {
    // 保证其只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        gk_swizzled_method(class, @selector(viewDidAppear:) ,@selector(gk_viewDidAppear:));
    });
}

- (void)gk_viewDidAppear:(BOOL)animated {
    
    // 在每次视图出现的时候重新设置当前控制器的手势
    [[NSNotificationCenter defaultCenter] postNotificationName:GKViewControllerPropertyChangedNotification object:@{@"viewController": self}];
    
    [self gk_viewDidAppear:animated];
}

- (BOOL)gk_interactivePopDisabled {
    return [objc_getAssociatedObject(self, GKInteractivePopKey) boolValue];
}

- (void)setGk_interactivePopDisabled:(BOOL)gk_interactivePopDisabled {
    objc_setAssociatedObject(self, GKInteractivePopKey, @(gk_interactivePopDisabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当属性改变时，发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:GKViewControllerPropertyChangedNotification object:@{@"viewController": self}];
}

- (BOOL)gk_fullScreenPopDisabled {
    return [objc_getAssociatedObject(self, GKFullScreenPopKey) boolValue];
}

- (void)setGk_fullScreenPopDisabled:(BOOL)gk_fullScreenPopDisabled {
    objc_setAssociatedObject(self, GKFullScreenPopKey, @(gk_fullScreenPopDisabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当属性改变时，发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:GKViewControllerPropertyChangedNotification object:@{@"viewController": self}];
}

- (CGFloat)gk_popMaxAllowedDistanceToLeftEdge {
    return [objc_getAssociatedObject(self, GKPopMaxDistanceKey) floatValue];
}

- (void)setGk_popMaxAllowedDistanceToLeftEdge:(CGFloat)gk_popMaxAllowedDistanceToLeftEdge {
    objc_setAssociatedObject(self, GKPopMaxDistanceKey, @(gk_popMaxAllowedDistanceToLeftEdge), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当属性改变时，发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:GKViewControllerPropertyChangedNotification object:@{@"viewController": self}];
}

- (CGFloat)gk_navBarAlpha {
    return [objc_getAssociatedObject(self, GKNavBarAlphaKey) floatValue];
}

- (void)setGk_navBarAlpha:(CGFloat)gk_navBarAlpha {
    objc_setAssociatedObject(self, GKNavBarAlphaKey, @(gk_navBarAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNavBarAlpha:gk_navBarAlpha];
}

- (id<GKViewControllerPushDelegate>)gk_pushDelegate {
    return objc_getAssociatedObject(self, GKPushDelegateKey);
}

- (void)setGk_pushDelegate:(id<GKViewControllerPushDelegate>)gk_pushDelegate {
    objc_setAssociatedObject(self, GKPushDelegateKey, gk_pushDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setNavBarAlpha:(CGFloat)alpha {
    
    UINavigationBar *navBar = nil;
    
    if ([self isKindOfClass:[GKNavigationBarViewController class]]) {
        GKNavigationBarViewController *vc = (GKNavigationBarViewController *)self;
        navBar = vc.gk_navigationBar;
        
        UIView *barBackgroundView = [navBar.subviews objectAtIndex:0];
        barBackgroundView.alpha = alpha;
        
    }else {
        navBar = self.navigationController.navigationBar;
        
        UIView *barBackgroundView = [navBar.subviews objectAtIndex:0]; // _UIBarBackground
        UIImageView *backgroundImageView = [barBackgroundView.subviews objectAtIndex:0]; // UIImageView
        
        if (navBar.isTranslucent) {
            if (backgroundImageView != nil && backgroundImageView.image != nil) {
                barBackgroundView.alpha = alpha;
            }else {
                UIView *backgroundEffectView = [barBackgroundView.subviews objectAtIndex:1]; // UIVisualEffectView
                if (backgroundEffectView != nil) {
                    backgroundEffectView.alpha = alpha;
                }
            }
        }else {
            barBackgroundView.alpha = alpha;
        }
    }
    // 底部分割线
    navBar.clipsToBounds = alpha == 0.0;
    
}

@end
