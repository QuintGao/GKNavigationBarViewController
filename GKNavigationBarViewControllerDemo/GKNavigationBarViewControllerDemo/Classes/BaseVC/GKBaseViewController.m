//
//  GKBaseViewController.m
//  GKNavigationBarExample
//
//  Created by QuintGao on 2020/3/28.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKBaseViewController.h"

@interface GKBaseViewController ()

@end

@implementation GKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
