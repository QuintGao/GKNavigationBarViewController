//
//  GKFloatTransition.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//

#import "GKFloatTransition.h"
#import "GKFloatView.h"

@interface GKFloatTransition()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, assign) GKFloatTransitionType type;

@end

@implementation GKFloatTransition

+ (instancetype)transitionWithType:(GKFloatTransitionType)type {
    return [[GKFloatTransition alloc] initWithType:type];
}

- (instancetype)initWithType:(GKFloatTransitionType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition {
    if (self.type == GKFloatTransitionTypePush) {
        [self pushTransition];
    }else if (self.type == GKFloatTransitionTypePop) {
        [self popTransition];
    }
}

- (void)pushTransition {
    self.isHideTabBar = self.fromViewController.tabBarController && self.toViewController.hidesBottomBarWhenPushed;
    __block UIView *fromView = nil;
    if (self.isHideTabBar) {
        // 获取fromVC的截图
        UIImage *captureImage = [self getCaptureWithView:self.fromViewController.view.window];
        UIImageView *captureView = [[UIImageView alloc] initWithImage:captureImage];
        captureView.frame = self.containerView.frame;
        [self.containerView addSubview:captureView];
        fromView = captureView;
        self.fromViewController.gk_captureImage = captureImage;
        self.fromViewController.view.hidden = YES;
        self.fromViewController.tabBarController.tabBar.hidden = YES;
    }else {
        fromView = self.fromViewController.view;
    }
    self.contentView = fromView;

    [self.containerView addSubview:self.toViewController.view];

    CGRect floatBallRect = [GKFloatView floatView].frame;
    [self.contentView addSubview:self.coverView];
    UIBezierPath *maskStartBP = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(floatBallRect.origin.x, floatBallRect.origin.y, floatBallRect.size.width, floatBallRect.size.height) cornerRadius:floatBallRect.size.height / 2];
    UIBezierPath *maskFinalBP = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:floatBallRect.size.width / 2];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskFinalBP.CGPath;
    self.toViewController.view.layer.mask = maskLayer;

    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id) (maskStartBP.CGPath);
    maskLayerAnimation.toValue = (__bridge id) ((maskFinalBP.CGPath));
    maskLayerAnimation.duration = self.animationDuration;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];

    [UIView animateWithDuration:0.5 animations:^{
//        [HKFloatManager shared].floatBall.alpha = 0;
    }];
}

- (void)popTransition {
    [self.containerView insertSubview:self.toViewController.view belowSubview:self.fromViewController.view];
    // 是否隐藏tabbar
    self.isHideTabBar = self.toViewController.tabBarController && self.fromViewController.hidesBottomBarWhenPushed;
    
    __block UIView *toView = nil;
    if (self.isHideTabBar) {
        UIImageView *captureView = [[UIImageView alloc] initWithImage:self.toViewController.gk_captureImage];
        captureView.frame = self.containerView.frame;
        [self.containerView insertSubview:captureView belowSubview:self.fromViewController.view];
        toView = captureView;
        self.toViewController.view.hidden = YES;
        self.toViewController.tabBarController.tabBar.hidden = YES;
    }else {
        toView = self.toViewController.view;
    }
    self.contentView = toView;

    [GKFloatView show];
    
    CGRect floatBallRect = [GKFloatView floatView].frame;
    [self.contentView addSubview:self.coverView];

    UIBezierPath *maskStartBP = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(floatBallRect.origin.x, floatBallRect.origin.y, floatBallRect.size.width, floatBallRect.size.height) cornerRadius:floatBallRect.size.height / 2];

    UIBezierPath *maskFinalBP = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:floatBallRect.size.width / 2];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskStartBP.CGPath;
    self.fromViewController.view.layer.mask = maskLayer;

    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.toValue = (__bridge id) (maskStartBP.CGPath);
    maskLayerAnimation.fromValue = (__bridge id) ((maskFinalBP.CGPath));
    maskLayerAnimation.duration = self.animationDuration;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];

    [UIView animateWithDuration:0.5 animations:^{
        self.coverView.alpha = 0;
    }];
}

#pragma mark - CABasicAnimation的Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self completeTransition];
    self.fromViewController.view.layer.mask = nil;
    self.toViewController.view.layer.mask = nil;
    [self.coverView removeFromSuperview];
    if (self.isHideTabBar) {
        [self.contentView removeFromSuperview];
        self.contentView = nil;
        if (self.type == GKFloatTransitionTypePush) {
            self.fromViewController.view.hidden = NO;
            if (self.fromViewController.navigationController.childViewControllers.count == 1) {
                self.fromViewController.tabBarController.tabBar.hidden = NO;
            }
        }else if (self.type == GKFloatTransitionTypePop) {
            self.toViewController.view.hidden = NO;
            if (self.toViewController.navigationController.childViewControllers.count == 1) {
                self.toViewController.tabBarController.tabBar.hidden = NO;
            }
        }
    }
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.5;
    };
    return _coverView;
}

@end
