//
//  GKDemoBaseViewController.m
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/23.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKDemoBaseViewController.h"

@interface GKDemoBaseViewController ()

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;

@property (nonatomic, strong) UISwitch *switch1;
@property (nonatomic, strong) UISwitch *switch2;

@property (nonatomic, strong) UIView *areaView;

@end

@implementation GKDemoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [UILabel new];
    label1.textColor = [UIColor blackColor];
    label1.text = @"侧滑返回手势：开";
    [label1 sizeToFit];
    label1.frame = CGRectMake(20, self.gk_navigationBar.bottom + 20, label1.width, label1.height);
    [self.view addSubview:label1];
    self.label1 = label1;
    
    UISwitch *switch1 = [[UISwitch alloc] init];
    switch1.x = label1.right + 50;
    switch1.centerY = label1.centerY;
    switch1.on = !self.gk_interactivePopDisabled;
    [self.view addSubview:switch1];
    [switch1 addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    self.switch1 = switch1;
    
    UILabel *label2 = [UILabel new];
    label2.textColor = [UIColor blackColor];
    label2.text = @"全屏返回手势：开";
    [label2 sizeToFit];
    label2.frame = CGRectMake(20, label1.bottom + 30, label2.width, label2.height);
    [self.view addSubview:label2];
    self.label2 = label2;
    
    UISwitch *switch2 = [[UISwitch alloc] init];
    switch2.x = label2.right + 50;
    switch2.centerY = label2.centerY;
    switch2.on = !self.gk_fullScreenPopDisabled;
    [self.view addSubview:switch2];
    [switch2 addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    self.switch2 = switch2;
    
    UILabel *label3 = [UILabel new];
    label3.textColor = [UIColor blackColor];
    label3.text = [NSString stringWithFormat:@"全屏手势区域：%f", self.view.width];
    [label3 sizeToFit];
    label3.frame = CGRectMake(20, label2.bottom + 30, label3.width, label3.height);
    [self.view addSubview:label3];
    self.label3 = label3;
    
    UISlider *slider = [UISlider new];
    slider.minimumValue = 0;
    slider.maximumValue = self.view.width;
    slider.value = self.view.width;
    slider.x = 20;
    slider.y = label3.bottom + 20;
    slider.width = self.view.width - 40;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    UIView *areaView = [UIView new];
    areaView.backgroundColor = [UIColor redColor];
    areaView.frame = CGRectMake(0, slider.bottom + 20, slider.value, 40);
    [self.view addSubview:areaView];
    self.areaView = areaView;
}

#pragma mark - User Action

- (void)switchAction:(UISwitch *)sender {
    if (sender == self.switch1) {
        self.gk_interactivePopDisabled = !self.gk_interactivePopDisabled;
        
        self.label1.text = [NSString stringWithFormat:@"侧滑返回手势：%@", self.gk_interactivePopDisabled ? @"关" : @"开"];
    }else {
        self.gk_fullScreenPopDisabled = !self.gk_fullScreenPopDisabled;
        
        self.label2.text = [NSString stringWithFormat:@"全屏返回手势：%@", self.gk_fullScreenPopDisabled ? @"关" : @"开"];
    }
}

- (void)sliderAction:(UISlider *)sender {
    self.gk_popMaxAllowedDistanceToLeftEdge = sender.value;
    
    self.label3.text = [NSString stringWithFormat:@"全屏手势区域：%f", sender.value];
    [self.label3 sizeToFit];
    
    self.areaView.width = sender.value == 0 ? self.view.width : sender.value;
}

@end
