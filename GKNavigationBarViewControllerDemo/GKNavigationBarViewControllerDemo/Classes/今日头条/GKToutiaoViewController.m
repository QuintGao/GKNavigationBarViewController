//
//  GKToutiaoViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/9.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKToutiaoViewController.h"
#import "GKToutiaoHomeViewController.h"
#import "GKToutiaoVideoViewController.h"
#import "GKToutiaoMicroViewController.h"
#import "GKToutiaoMineViewController.h"

@interface GKToutiaoViewController ()

@end

@implementation GKToutiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    
    [self addChildVCs];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)addChildVCs {
    
    [self addChildVC:[GKToutiaoHomeViewController new]  title:@"首页" imageName:@"Home"];
    [self addChildVC:[GKToutiaoVideoViewController new] title:@"视频" imageName:@"Home"];
    [self addChildVC:[GKToutiaoMicroViewController new] title:@"微头条" imageName:@"Home"];
    [self addChildVC:[GKToutiaoMineViewController new]  title:@"我的" imageName:@"Home"];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {
    
    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[imageName stringByAppendingString:@"_selected"]];
    
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:(212 / 255.0) green:(25 /255.0) blue:(37 / 255.0) alpha:1.0]} forState:UIControlStateSelected];
    
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:YES];
    nav.gk_openScrollLeftPush = YES;
    
    [self addChildViewController:nav];
}

@end
