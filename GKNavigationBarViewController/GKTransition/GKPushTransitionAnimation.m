//
//  GKPushTransitionAnimation.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKPushTransitionAnimation.h"
#import "GKCommon.h"

@implementation GKPushTransitionAnimation

- (void)animateTransition {
    // 解决UITabBarController左滑push时的显示问题
    self.isHideTabBar = self.fromViewController.tabBarController && self.toViewController.hidesBottomBarWhenPushed;
    
    CGFloat screenW = self.containerView.bounds.size.width;
    CGFloat screenH = self.containerView.bounds.size.height;
    
    __block UIView *fromView = nil;
    
    if (self.isHideTabBar) {
        // 获取fromVC的截图
        UIImage *captureImage = [self getCaptureWithView:self.fromViewController.view.window];
        UIImageView *captureView = [[UIImageView alloc] initWithImage:captureImage];
        captureView.frame = CGRectMake(0, 0, screenW, screenH);
        [self.containerView addSubview:captureView];
        fromView = captureView;
        self.fromViewController.gk_captureImage = captureImage;
        self.fromViewController.view.hidden = YES;
        self.fromViewController.tabBarController.tabBar.hidden = YES;
    }else {
        fromView = self.fromViewController.view;
    }
    self.contentView = fromView;
    
    if (self.scale) {
        // 初始化阴影并添加
        self.shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [fromView addSubview:self.shadowView];
    }
    
    
    // 设置toViewController
    self.toViewController.view.frame = CGRectMake(screenW, 0, screenW, screenH);
    self.toViewController.view.layer.shadowColor   = [[UIColor blackColor] CGColor];
    self.toViewController.view.layer.shadowOpacity = 0.15f;
    self.toViewController.view.layer.shadowRadius  = 3.0f;
    [self.containerView addSubview:self.toViewController.view];
    
    // 执行动画
    [UIView animateWithDuration:[self transitionDuration:self.transitionContext] animations:^{
        if (self.scale) {
            self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
            if (@available(iOS 11.0, *)) {
                CGRect frame = fromView.frame;
                frame.origin.x     = GKConfigure.gk_translationX;
                frame.origin.y     = GKConfigure.gk_translationY;
                frame.size.height -= 2 * GKConfigure.gk_translationY;
                fromView.frame = frame;
            }else {
                fromView.transform = CGAffineTransformMakeScale(GKConfigure.gk_scaleX, GKConfigure.gk_scaleY);
            }
        }else {
            fromView.frame = CGRectMake(- (0.3 * screenW), 0, screenW, screenH);
        }
        
        self.toViewController.view.frame = CGRectMake(0, 0, screenW, screenH);
    }completion:^(BOOL finished) {
        [self completeTransition];
        if (self.isHideTabBar) {
            [self.contentView removeFromSuperview];
            self.contentView = nil;
            
            self.fromViewController.view.hidden = NO;
            if (self.fromViewController.navigationController.childViewControllers.count == 1) {
                self.fromViewController.tabBarController.tabBar.hidden = NO;
            }
        }
        if (self.scale) {
            [self.shadowView removeFromSuperview];            
        }
    }];
}

@end
