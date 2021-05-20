//
//  GKWYMusicViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYMusicViewController.h"
#import "GKWYMusicFindViewController.h"
#import "GKWYMusicMineViewController.h"
#import "GKWYMusicFriendViewController.h"
#import "GKWYMusicAccountViewController.h"

@interface GKWYMusicViewController ()

@end

@implementation GKWYMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.tabBar.translucent = NO;
    
    [self addChildVCs];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)addChildVCs {
    
    [self addChildVC:[GKWYMusicFindViewController new]  title:@"发现音乐" imageName:@"discovery"];
    [self addChildVC:[GKWYMusicMineViewController new] title:@"我的音乐" imageName:@"music"];
    [self addChildVC:[GKWYMusicFriendViewController new] title:@"朋友" imageName:@"friend"];
    [self addChildVC:[GKWYMusicAccountViewController new]  title:@"账号" imageName:@"account"];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {
    
    vc.tabBarItem.title = title;
    
    NSString *normalImageName = [NSString stringWithFormat:@"cm2_btm_icn_%@", imageName];
    
    NSString *selectImageName = [normalImageName stringByAppendingString:@"_prs"];
    
    vc.tabBarItem.image = [UIImage imageNamed:normalImageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
    
    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:NO];
    
    [self addChildViewController:nav];
}

@end
