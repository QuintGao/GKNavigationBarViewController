//
//  GKPopTransitionAnimation.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKPopTransitionAnimation.h"
#import "GKCommon.h"

@implementation GKPopTransitionAnimation

- (void)animateTransition {
    [self.containerView insertSubview:self.toViewController.view belowSubview:self.fromViewController.view];
    
    // 是否隐藏tabbar
    self.isHideTabBar = self.toViewController.tabBarController && self.fromViewController.hidesBottomBarWhenPushed && self.toViewController.gk_captureImage;
    
    CGFloat screenW = self.containerView.bounds.size.width;
    CGFloat screenH = self.containerView.bounds.size.height;
    
    __block UIView *toView = nil;
    
    if (self.isHideTabBar) {
        UIImageView *captureView = [[UIImageView alloc] initWithImage:self.toViewController.gk_captureImage];
        captureView.frame = CGRectMake(0, 0, screenW, screenH);
        [self.containerView insertSubview:captureView belowSubview:self.fromViewController.view];
        toView = captureView;
        self.toViewController.view.hidden = YES;
        self.toViewController.tabBarController.tabBar.hidden = YES;
    }else {
        toView = self.toViewController.view;
    }
    self.contentView = toView;
    
    if (self.scale) {
        // 初始化阴影图层
        self.shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [toView addSubview:self.shadowView];
        
        if (@available(iOS 11.0, *)) {
            CGRect frame = toView.frame;
            frame.origin.x     = GKConfigure.gk_translationX;
            frame.origin.y     = GKConfigure.gk_translationY;
            frame.size.height -= 2 * GKConfigure.gk_translationY;
            toView.frame = frame;
        }else {
            toView.transform = CGAffineTransformMakeScale(GKConfigure.gk_scaleX, GKConfigure.gk_scaleY);
        }
    }else {
        toView.frame = CGRectMake(- (0.3 * screenW), 0, screenW, screenH);
    }
    
    // 添加阴影
    self.fromViewController.view.layer.shadowColor   = [[UIColor blackColor] CGColor];
    self.fromViewController.view.layer.shadowOpacity = 0.15f;
    self.fromViewController.view.layer.shadowRadius  = 3.0f;
    
    [UIView animateWithDuration:[self transitionDuration:self.transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.fromViewController.view.frame = CGRectMake(screenW, 0, screenW, screenH);
        
        if (self.scale) {
            self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        }
        
        if (@available(iOS 11.0, *)) {
            toView.frame = CGRectMake(0, 0, screenW, screenH);
        }else {
            toView.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        [self completeTransition];
        if (self.isHideTabBar) {
            [self.contentView removeFromSuperview];
            self.contentView = nil;
            
            self.toViewController.view.hidden = NO;
            if (self.toViewController.navigationController.childViewControllers.count == 1) {
                self.toViewController.tabBarController.tabBar.hidden = NO;
            }
        }
        if (self.scale) {
            [self.shadowView removeFromSuperview];
        }
    }];
}

@end
