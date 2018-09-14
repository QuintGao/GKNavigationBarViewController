//
//  GKDemo004ViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo005ViewController.h"
#import "GKTab001ViewController.h"
#import "GKTab002ViewController.h"
#import "GKTab003ViewController.h"

@interface GKDemo005ViewController ()

@end

@implementation GKDemo005ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor redColor];
    
    [self addChildVC:[GKTab001ViewController new] title:@"首页" imageName:@"Home"];
    [self addChildVC:[GKTab002ViewController new] title:@"活动" imageName:@"Activity"];
    [self addChildVC:[GKTab003ViewController new] title:@"我的" imageName:@"Mine"];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)name {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:name];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", name]];
    
    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:NO];
    nav.gk_openScrollLeftPush = YES;
    
    [self addChildViewController:nav];
}

@end
