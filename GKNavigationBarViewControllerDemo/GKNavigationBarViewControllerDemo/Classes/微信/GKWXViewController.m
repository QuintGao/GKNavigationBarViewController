//
//  GKWXViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKWXViewController.h"
#import "GKWXHomeViewController.h"
#import "GKWXFindViewController.h"
#import "GKWXMineViewController.h"

@interface GKWXViewController ()

@end

@implementation GKWXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVC:[GKWXHomeViewController new] title:@"微信" imageName:@"Home"];
    [self addChildVC:[GKWXFindViewController new] title:@"发现" imageName:@"Activity"];
    [self addChildVC:[GKWXMineViewController new] title:@"我的" imageName:@"Mine"];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[imageName stringByAppendingString:@"_selected"]];
    
    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:NO];
    [self addChildViewController:nav];
}

@end
