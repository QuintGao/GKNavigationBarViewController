//
//  UINavigationController+GKRotation.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/31.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UINavigationController+GKRotation.h"

@implementation UINavigationController (GKRotation)

#pragma mark - 控制屏幕旋转的方法
- (BOOL)shouldAutorotate {
    return self.visibleViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.visibleViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.visibleViewController.preferredInterfaceOrientationForPresentation;
}

@end
