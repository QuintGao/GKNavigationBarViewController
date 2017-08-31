//
//  UITabBarController+GKRotation.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/31.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UITabBarController+GKRotation.h"

@implementation UITabBarController (GKRotation)

#pragma mark - 控制屏幕旋转
- (BOOL)shouldAutorotate {
    UIViewController *vc = self.selectedViewController;
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [(UINavigationController *)vc shouldAutorotate];
    }
    return vc.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIViewController *vc = self.selectedViewController;
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [(UINavigationController *)vc supportedInterfaceOrientations];
    }
    return vc.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    UIViewController *vc = self.selectedViewController;
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [(UINavigationController *)vc preferredInterfaceOrientationForPresentation];
    }
    return vc.preferredInterfaceOrientationForPresentation;
}

@end
