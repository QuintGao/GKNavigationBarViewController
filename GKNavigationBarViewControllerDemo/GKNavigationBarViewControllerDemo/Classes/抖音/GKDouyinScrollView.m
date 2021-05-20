//
//  GKDouyinScrollView.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2018/9/11.
//  Copyright © 2018年 QuintGao. All rights reserved.
//

#import "GKDouyinScrollView.h"

@implementation GKDouyinScrollView

#pragma mark - 解决全屏滑动时的手势冲突
// 当UIScrollView在水平方向滑动到第一个时，默认是不能全屏滑动返回的，通过下面的方法可实现其滑动返回。
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([self panBack:gestureRecognizer]) {
        return YES;
    }
    
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
            
            // 临界点：scrollView滑动到最后一屏时的x轴位置，可根据需求改变
            CGFloat criticalPoint = [UIScreen mainScreen].bounds.size.width;
            
            // point.x < 0 代表左滑即手指从屏幕右边向左移动
            // 当UIScrollview滑动到临界点时，则不再相应UIScrollview的滑动左滑手势，防止与左滑手势冲突
            if (point.x < 0 && self.contentOffset.x == criticalPoint) {
                return YES;
            }
        }
    }
    return NO;
}

@end
