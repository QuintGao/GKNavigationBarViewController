//
//  GKNavigationBar.h
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/9/20.
//  Copyright © 2017年 QuintGao. All rights reserved.
//  自定义的导航条

#import <UIKit/UIKit.h>

@interface GKNavigationBar : UINavigationBar

/** 导航栏背景色透明度，默认是1.0 */
@property (nonatomic, assign) CGFloat   gk_navBarBackgroundAlpha;

// 导航栏分割线是否隐藏
@property (nonatomic, assign) BOOL      gk_navLineHidden;

// 在非全屏模式下显示
@property (nonatomic, assign) BOOL    gk_nonFullScreen;

@end
