//
//  GKWYNewsViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYNewsViewController.h"
#import "GKNavigationBarConfigure.h"
#import "UINavigationController+GKCategory.h"
#import "GKWYNewsHomeViewController.h"
#import "GKWYNewsNewViewController.h"
#import "GKWYNewsLiveViewController.h"
#import "GKWYNewsVideoViewController.h"
#import "GKWYNewsProfileViewController.h"

@interface GKWYNewsViewController ()

@end

@implementation GKWYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    
    // 添加子控制器
    [self addChildVCs];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)addChildVCs {
    [self addChildVC:[GKWYNewsHomeViewController new] title:@"首页" imageName:@"Home"];
    [self addChildVC:[GKWYNewsNewViewController new] title:@"要闻" imageName:@"Home"];
    [self addChildVC:[GKWYNewsLiveViewController new] title:@"直播" imageName:@"Home"];
    [self addChildVC:[GKWYNewsVideoViewController new] title:@"视频" imageName:@"Home"];
    [self addChildVC:[GKWYNewsProfileViewController new] title:@"我" imageName:@"Home"];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];
    
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:(212 / 255.0) green:(25 /255.0) blue:(37 / 255.0) alpha:1.0]} forState:UIControlStateSelected];
    
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:NO];
    nav.gk_openScrollLeftPush = YES;
    
    [self addChildViewController:nav];
}


@end
