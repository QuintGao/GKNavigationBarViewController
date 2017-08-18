//
//  UIViewController+GKCategory.h
//  GKCustomNavigationBar
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 高坤. All rights reserved.
//  使用运行时为UIViewController添加分类

#import <UIKit/UIKit.h>

extern NSString *const GKViewControllerPropertyChangedNotification;

// 交给单独控制器处理
@protocol GKViewControllerPushDelegate <NSObject>

@optional
- (void)pushToNextViewController;

@end

@interface UIViewController (GKCategory)

/** 是否禁止当前控制器的滑动返回(包括全屏返回和边缘返回) */
@property (nonatomic, assign) BOOL gk_interactivePopDisabled;

/** 是否禁止当前控制器的全屏滑动返回 */
@property (nonatomic, assign) BOOL gk_fullScreenPopDisabled;

/** 全屏滑动时，滑动区域距离屏幕左边的最大位置，默认是0：表示全屏都可滑动 */
@property (nonatomic, assign) CGFloat gk_popMaxAllowedDistanceToLeftEdge;

/** 设置导航栏的透明度 */
@property (nonatomic, assign) CGFloat gk_navBarAlpha;

/** push代理 */
@property (nonatomic, assign) id<GKViewControllerPushDelegate> gk_pushDelegate;

@end
