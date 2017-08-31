//
//  GKNavigationBarConfigure.h
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import <UIKit/UIKit.h>

// 图片路径
#define GKSrcName(file) [@"GKNavigationBarViewController.bundle" stringByAppendingPathComponent:file]

#define GKFrameworkSrcName(file) [@"Frameworks/GKNavigationBarViewController.framework/GKNavigationBarViewController.bundle" stringByAppendingPathComponent:file]

#define GKImage(file)  [UIImage imageNamed:GKSrcName(file)] ? : [UIImage imageNamed:GKFrameworkSrcName(file)]

#define GKConfigure [GKNavigationBarConfigure sharedInstance]

typedef NS_ENUM(NSUInteger, GKNavigationBarBackStyle) {
    GKNavigationBarBackStyleBlack,   // 黑色返回按钮
    GKNavigationBarBackStyleWhite    // 白色返回按钮
};

@interface GKNavigationBarConfigure : NSObject

/** 导航栏背景色 */
@property (nonatomic, strong) UIColor *backgroundColor;

/** 导航栏标题颜色 */
@property (nonatomic, strong) UIColor *titleColor;

/** 导航栏标题字体 */
@property (nonatomic, strong) UIFont *titleFont;

/** 状态栏是否隐藏 */
@property (nonatomic, assign) BOOL statusBarHidden;

/** 状态栏类型 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/** 返回按钮类型 */
@property (nonatomic, assign) GKNavigationBarBackStyle backStyle;

+ (instancetype)sharedInstance;

// 统一配置导航栏外观，最好在AppDelegate中配置
- (void)setupDefaultConfigure;

// 自定义
- (void)setupCustomConfigure:(void (^)(GKNavigationBarConfigure *configure))block;

// 获取当前显示的控制器
- (UIViewController *)visibleController;

@end
