//
//  SecondViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@property (nonatomic, assign) BOOL change;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor    = [UIColor whiteColor];
    
//    self.gk_navBackgroundColor   = [UIColor blueColor];
    
//    self.gk_navigationBar.backgroundColor = [UIColor redColor];
    
    self.gk_statusBarStyle    = UIStatusBarStyleDefault;
    self.gk_statusBarHidden   = YES;
    
    self.gk_navigationItem.title = @"😁😁😁";
    
    self.gk_fullScreenPopDisabled = YES;
    
    for (NSInteger i = 0; i < 5; i++) {
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor redColor];
        [self addChildViewController:vc];
        [self.view addSubview:vc.view];
        
        vc.view.frame = CGRectMake(100, 100, 100, 100);
    }
    
    self.navItem_space = 10.0f;
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:[UIImage imageNamed:@"info_white"] target:nil action:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    if (self.change) {
//        self.change = NO;
//        self.gk_navShadowImage = nil;
//    }else {
//        self.change = YES;
//        self.gk_navShadowColor = [UIColor blackColor];
//    }
    
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:^{
            UIViewController *vc = [UIViewController new];
            
            [[GKConfigure visibleController] presentViewController:vc animated:NO completion:^{
                [vc dismissViewControllerAnimated:NO completion:nil];
            }];
        }];
    }else {
        [self.navigationController pushViewController:[ThirdViewController new] animated:YES];
    }
}

- (void)dealloc {
    NSLog(@"SecondViewController 销毁了");
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
