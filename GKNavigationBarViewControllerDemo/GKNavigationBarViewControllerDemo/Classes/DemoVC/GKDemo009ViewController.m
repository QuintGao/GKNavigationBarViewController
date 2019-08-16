//
//  GKDemo009ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/9/10.
//  Copyright © 2018年 gaokun. All rights reserved.
//

#import "GKDemo009ViewController.h"
#import "GKDemo001ViewController.h"

@interface GKDemo009ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, assign) BOOL isHideLine;

@end

@implementation GKDemo009ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navBackgroundColor = [UIColor lightGrayColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navShadowColor = [UIColor redColor];
    
    self.gk_navTitle = @"GKDemo009";
    
    UIButton *photoBtn = [UIButton new];
    [photoBtn setTitle:@"相册" forState:UIControlStateNormal];
    photoBtn.backgroundColor = [UIColor blackColor];
    [photoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(photoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoBtn];
    
    UIButton *cameraBtn = [UIButton new];
    [cameraBtn setTitle:@"相机" forState:UIControlStateNormal];
    cameraBtn.backgroundColor = [UIColor blackColor];
    [cameraBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cameraBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cameraBtn];
    
    [photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40.0f);
        make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(80.0f);
        make.width.mas_equalTo(80.0f);
        make.height.mas_equalTo(30.0f);
    }];
    
    [cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-40.0f);
        make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(80.0f);
        make.width.mas_equalTo(80.0f);
        make.height.mas_equalTo(30.0f);
    }];
}

- (void)photoBtnClick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    picker.delegate = self;
    GKConfigure.gk_disableFixSpace = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)cameraBtnClick:(id)sender {
    if (TARGET_IPHONE_SIMULATOR) {
        NSLog(@"模拟器不支持调用相机");
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    GKConfigure.gk_disableFixSpace = NO;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        self.gk_statusBarHidden = NO;
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    GKConfigure.gk_disableFixSpace = NO;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        self.gk_statusBarHidden = NO;
    }];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
