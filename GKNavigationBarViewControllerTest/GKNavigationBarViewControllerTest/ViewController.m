//
//  ViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/23.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "FourViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, TZImagePickerControllerDelegate>

@property (nonatomic, assign) BOOL show;

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor whiteColor];
        
    self.gk_navigationItem.title = @"你好啊";
    
    self.gk_navBackgroundColor = [UIColor blueColor];
    
    self.show = YES;
    
    self.btn = [UIButton new];
    [self.btn setTitle:@"相册" forState:UIControlStateNormal];
    self.btn.frame = CGRectMake(100, 100, 60, 40);
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = [UIColor blackColor];
    [self.btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 100, 44);
    
    self.gk_navTitleView = redView;
    
    UIButton *leftBtn = [UIButton new];
    [leftBtn setTitle:@"push" forState:UIControlStateNormal];
    leftBtn.backgroundColor = [UIColor redColor];
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [UIButton new];
    [rightBtn setTitle:@"present" forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor redColor];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    self.gk_StatusBarHidden = NO;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self viewWillLayoutSubviews];
//        [self.gk_navigationBar layoutIfNeeded];
//    });
}

- (void)pushAction {
    
}

- (void)presentAction {
    FourViewController *fourVC = [FourViewController new];
    
    UINavigationController *nav = [UINavigationController rootVC:fourVC translationScale:NO];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)click {

    TZImagePickerController *pickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [self presentViewController:pickerVC animated:YES completion:nil];
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
//        UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
//        pickerVC.delegate = self;
//        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//
//        [self presentViewController:pickerVC animated:YES completion:^{
//            pickerVC.delegate = self;
//        }];
//    }
}

#pragma mark - TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    UIViewController *vc = [UIViewController new];
    
    [[GKConfigure visibleController] presentViewController:vc animated:NO completion:^{
        [vc dismissViewControllerAnimated:NO completion:nil];
    }];
    
    
    NSLog(@"%@", photos);
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [SecondViewController new];

    [self presentViewController:vc animated:YES completion:nil];
    
//    [self.navigationController pushViewController:vc animated:YES];
//    self.gk_StatusBarHidden = !self.gk_StatusBarHidden;
//    if (self.show) {
//        self.show = NO;
//
//        [self hideNavLine];
//
//    }else {
//        self.show = YES;
//
//        [self showNavLine];
//    }

}


@end
