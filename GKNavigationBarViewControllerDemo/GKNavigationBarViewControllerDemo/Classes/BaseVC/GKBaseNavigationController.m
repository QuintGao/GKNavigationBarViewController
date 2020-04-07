//
//  GKBaseNavigationController.m
//  GKNavigationBarExample
//
//  Created by QuintGao on 2020/3/28.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKBaseNavigationController.h"

@interface GKBaseNavigationController ()

@end

@implementation GKBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

@end
