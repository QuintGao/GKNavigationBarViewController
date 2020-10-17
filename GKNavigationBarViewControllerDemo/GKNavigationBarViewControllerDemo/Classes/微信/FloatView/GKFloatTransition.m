//
//  GKFloatTransition.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//

#import "GKFloatTransition.h"
#import "GKFloatView.h"

@interface GKFloatTransition()<CAAnimationDelegate>

@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;

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

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;

    if (self.type == GKFloatTransitionTypePush) {
        [self pushTransition:transitionContext];
    }else {
        [self popTransition:transitionContext];
    }
}

- (void)pushTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *contView = [transitionContext containerView];
    [contView addSubview:fromVC.view];
    [contView addSubview:toVC.view];

    CGRect floatBallRect = [GKFloatView floatView].frame;
    [fromVC.view addSubview:self.coverView];
    UIBezierPath *maskStartBP = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(floatBallRect.origin.x, floatBallRect.origin.y, floatBallRect.size.width, floatBallRect.size.height) cornerRadius:floatBallRect.size.height / 2];
    UIBezierPath *maskFinalBP = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:floatBallRect.size.width / 2];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskFinalBP.CGPath;
    toVC.view.layer.mask = maskLayer;

    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id) (maskStartBP.CGPath);
    maskLayerAnimation.toValue = (__bridge id) ((maskFinalBP.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];

    [UIView animateWithDuration:0.5 animations:^{
//        [HKFloatManager shared].floatBall.alpha = 0;
    }];
}

- (void)popTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *contView = [transitionContext containerView];
    [contView addSubview:toVC.view];
    [contView addSubview:fromVC.view];

    CGRect floatBallRect = [GKFloatView floatView].frame;
    [toVC.view addSubview:self.coverView];

    UIBezierPath *maskStartBP = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(floatBallRect.origin.x, floatBallRect.origin.y, floatBallRect.size.width, floatBallRect.size.height) cornerRadius:floatBallRect.size.height / 2];

    UIBezierPath *maskFinalBP = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:floatBallRect.size.width / 2];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskStartBP.CGPath;
    fromVC.view.layer.mask = maskLayer;

    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.toValue = (__bridge id) (maskStartBP.CGPath);
    maskLayerAnimation.fromValue = (__bridge id) ((maskFinalBP.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];


    [UIView animateWithDuration:0.5 animations:^{
        self.coverView.alpha = 0;
    }];
    [UIView animateWithDuration:0.5 animations:^{
//        [HKFloatManager shared].floatBall.alpha = 1;
    }];
}

#pragma mark - CABasicAnimation的Delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self.transitionContext completeTransition:YES];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    [self.coverView removeFromSuperview];
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
