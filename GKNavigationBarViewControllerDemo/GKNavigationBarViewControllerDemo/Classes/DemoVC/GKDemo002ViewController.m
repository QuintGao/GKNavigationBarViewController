//
//  GKDemo002ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2018/7/31.
//  Copyright © 2018年 gaokun. All rights reserved.
//

#import "GKDemo002ViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>

@interface GKDemo002ViewController ()<TZImagePickerControllerDelegate>

@end

@implementation GKDemo002ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navigationItem.title = @"嵌套TZImagePickerController";
    
    self.gk_statusBarStyle = UIStatusBarStyleDefault;
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:16.0f];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"点击屏幕选取图片";
    [label sizeToFit];
    
    label.frame = CGRectMake(0, 200, self.view.frame.size.width, label.frame.size.height);
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TZImagePickerController *pickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    GKConfigure.gk_disableFixSpace = YES;
    [self presentViewController:pickerVC animated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

#pragma mark - TZImagePickerControllerDelegate
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    GKConfigure.gk_disableFixSpace = NO;
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    GKConfigure.gk_disableFixSpace = NO;
}

@end
