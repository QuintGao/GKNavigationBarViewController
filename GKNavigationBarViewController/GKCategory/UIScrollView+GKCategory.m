//
//  UIScrollView+GKCategory.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "UIScrollView+GKCategory.h"
#import <objc/runtime.h>
#import "GKNavigationBarConfigure.h"

static const void* GKOpenGestureHandleKey = @"GKOpenGestureHandleKey";

@implementation UIScrollView (GKCategory)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray <NSString *> *oriSels = @[@"willMoveToSuperview:"];
        
        [oriSels enumerateObjectsUsingBlock:^(NSString * _Nonnull oriSel, NSUInteger idx, BOOL * _Nonnull stop) {
            gk_swizzled_method(@"gkGesture", self, oriSel, self);
        }];
    });
}

- (void)gkGesture_willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview && GKConfigure.gk_openScrollViewGestureHandle) {
        self.gk_openGestureHandle = YES;
    }
    [self gkGesture_willMoveToSuperview:newSuperview];
}

- (void)setGk_openGestureHandle:(BOOL)gk_openGestureHandle {
    objc_setAssociatedObject(self, GKOpenGestureHandleKey, @(gk_openGestureHandle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)gk_openGestureHandle {
    return [objc_getAssociatedObject(self, GKOpenGestureHandleKey) boolValue];
}

#pragma mark - 解决全屏滑动时的手势冲突
// 当UIScrollView在水平方向滑动到第一个时，默认是不能全屏滑动返回的，通过下面的方法可实现其滑动返回。
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.gk_openGestureHandle) return YES;

    if ([self panBack:gestureRecognizer]) return NO;
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (!self.gk_openGestureHandle) return NO;
    
    if ([self panBack:gestureRecognizer]) return YES;
    
    return NO;
}

- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.panGestureRecognizer) {
        CGPoint point = [self.panGestureRecognizer translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        
        // 设置手势滑动的位置距屏幕左边的区域
        CGFloat locationDistance = [UIScreen mainScreen].bounds.size.width;
        
        if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStatePossible) {
            CGPoint location = [gestureRecognizer locationInView:self];
            if (point.x > 0 && location.x < locationDistance && self.contentOffset.x <= 0) {
                return YES;
            }
        }
    }
    return NO;
}

@end
