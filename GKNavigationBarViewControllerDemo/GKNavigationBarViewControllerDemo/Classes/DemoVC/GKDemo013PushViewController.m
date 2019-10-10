//
//  GKDemo013PushViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/10/10.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import "GKDemo013PushViewController.h"
#import "GKPushTab001ViewController.h"
#import "GKPushTab002ViewController.h"

@interface GKDemo013PushViewController ()

@end

@implementation GKDemo013PushViewController

- (instancetype)initWithScale:(BOOL)isScale {
    if (self = [super init]) {
        self.isScale = isScale;
        
        self.tabBar.tintColor = [UIColor redColor];
        self.tabBar.translucent = NO;
        
        GKPushTab001ViewController *demo001 = [GKPushTab001ViewController new];
        demo001.isScale = self.isScale;
        
        GKPushTab002ViewController *demo002 = [GKPushTab002ViewController new];
        demo002.isScale = self.isScale;
        
        [self addChildVC:demo001 title:@"首页" imageName:@"Home"];
        [self addChildVC:demo002 title:@"活动" imageName:@"Activity"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)name {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:name];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", name]];
    
    UINavigationController *nav = [UINavigationController rootVC:vc translationScale:self.isScale];
    nav.gk_openScrollLeftPush = YES;
    
    [self addChildViewController:nav];
}

@end
