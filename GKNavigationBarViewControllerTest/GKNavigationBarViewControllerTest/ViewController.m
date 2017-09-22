//
//  ViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/23.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

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
}

- (void)click {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
        pickerVC.delegate = self;
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:pickerVC animated:YES completion:^{
            pickerVC.delegate = self;
        }];
    }
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

    [self.navigationController pushViewController:vc animated:YES];
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
