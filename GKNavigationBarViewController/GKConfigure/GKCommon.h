//
//  GKCommon.h
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/10/13.
//  Copyright © 2017年 QuintGao. All rights reserved.
//  一些公共的方法、宏定义、枚举等

#ifndef GKCommon_h
#define GKCommon_h

#import <objc/runtime.h>

#define GKConfigure                     [GKNavigationBarConfigure sharedInstance]

// 操作系统版本号，只获取第二级的版本号，例如 10.3.1 只会得到 10.3
#define GK_SYSTEM_VERSION               ([[[UIDevice currentDevice] systemVersion] doubleValue])

/// 是否横竖屏
/// 用户界面横屏了才会返回YES
#define GK_IS_LANDSCAPE             UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)

// 带物理凹槽的刘海屏
#define GK_NOTCHED_SCREEN               [GKNavigationBarConfigure isNotchedScreen]

// 判断是否是iPad
#define GK_IS_iPad                      [GKNavigationBarConfigure isIPad]

// 屏幕相关
#define GK_SCREEN_WIDTH                 [UIScreen mainScreen].bounds.size.width
#define GK_SCREEN_HEIGHT                [UIScreen mainScreen].bounds.size.height
// 顶部安全区域高度
#define GK_SAFEAREA_TOP                 [GKNavigationBarConfigure safeAreaInsets].top
// 底部安全区域高度
#define GK_SAFEAREA_BTM                 [GKNavigationBarConfigure safeAreaInsets].bottom
// 状态栏高度
#define GK_STATUSBAR_HEIGHT             [GKNavigationBarConfigure statusBarFrame].size.height
// 导航栏高度
#define GK_NAVBAR_HEIGHT                [GKNavigationBarConfigure navBarHeight]
// 非全屏导航栏高度
#define GK_NAVBAR_HEIGHT_NFS            [GKNavigationBarConfigure navBarHeight_nonFullScreen]
// 状态栏+导航栏高度
#define GK_STATUSBAR_NAVBAR_HEIGHT      (GK_STATUSBAR_HEIGHT + GK_NAVBAR_HEIGHT)
// tabbar高度
#define GK_TABBAR_HEIGHT                [GKNavigationBarConfigure tabBarHeight]

// 导航栏间距，用于不同控制器之间的间距
static const CGFloat GKNavigationBarItemSpace = -1;

typedef NS_ENUM(NSUInteger, GKNavigationBarBackStyle) {
    GKNavigationBarBackStyleNone,    // 无返回按钮，可自行设置
    GKNavigationBarBackStyleBlack,   // 黑色返回按钮
    GKNavigationBarBackStyleWhite    // 白色返回按钮
};

// 使用static inline创建静态内联函数，方便调用
static inline void gk_swizzled_method(NSString *prefix, Class oldClass ,NSString *oldSelector, Class newClass) {
    NSString *newSelector = [NSString stringWithFormat:@"%@_%@", prefix, oldSelector];
    
    SEL originalSelector = NSSelectorFromString(oldSelector);
    SEL swizzledSelector = NSSelectorFromString(newSelector);
    
    Method originalMethod = class_getInstanceMethod(oldClass, NSSelectorFromString(oldSelector));
    Method swizzledMethod = class_getInstanceMethod(newClass, NSSelectorFromString(newSelector));
    
    BOOL isAdd = class_addMethod(oldClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isAdd) {
        class_replaceMethod(newClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#endif /* GKCommon_h */
