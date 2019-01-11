//
//  GKDemo004ViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo004ViewController.h"
#import "GKTab001ViewController.h"
#import "GKTab002ViewController.h"
#import "GKTab003ViewController.h"

@interface GKDemo004ViewController ()<UITabBarControllerDelegate>

@end

@implementation GKDemo004ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor redColor];
    
    self.delegate = self;
    
//    [self addChildVC:[GKTab001ViewController new] title:@"首页" imageName:@"Home"];
//    [self addChildVC:[GKTab002ViewController new] title:@"活动" imageName:@"Activity"];
//    [self addChildVC:[GKTab003ViewController new] title:@"我的" imageName:@"Mine"];
    
    UINavigationController *nav0 = [UINavigationController rootVC:[GKTab001ViewController new] translationScale:NO];
    nav0.gk_openScrollLeftPush = YES;
    
    UINavigationController *nav1 = [UINavigationController rootVC:[GKTab002ViewController new] translationScale:NO];
    nav1.gk_openScrollLeftPush = YES;
    
    UINavigationController *nav2 = [UINavigationController rootVC:[GKTab003ViewController new] translationScale:NO];
    nav2.gk_openScrollLeftPush = YES;
    
    [self addChildVC:nav0 title:@"首页" imageName:@"Home"];
    [self addChildVC:nav1 title:@"活动" imageName:@"Activity"];
    [self addChildVC:nav2 title:@"我的" imageName:@"Mine"];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)name {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:name];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", name]];

//    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:NO];
//    nav.gk_openScrollLeftPush = YES;
    
    [self addChildViewController:vc];
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    self.gk_fullScreenPopDisabled = viewController.gk_fullScreenPopDisabled;
    self.gk_interactivePopDisabled = viewController.gk_interactivePopDisabled;
    self.gk_popMaxAllowedDistanceToLeftEdge = viewController.gk_popMaxAllowedDistanceToLeftEdge;
}

@end
