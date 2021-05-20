//
//  UIScrollView+GKCategory.h
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GKCategory)

/// 是否开启UIScrollView左滑返回手势处理，默认NO
@property (nonatomic, assign) BOOL  gk_openGestureHandle;

@end
