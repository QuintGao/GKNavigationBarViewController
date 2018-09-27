//
//  GKDemo008ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2018/7/31.
//  Copyright © 2018年 gaokun. All rights reserved.
//

#import "GKDemo008ViewController.h"
#import "TZImagePickerController.h"

@interface GKDemo008ViewController ()<TZImagePickerControllerDelegate>

@end

@implementation GKDemo008ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navigationItem.title = @"嵌套TZImagePickerController";
    
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
    [self presentViewController:pickerVC animated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

#pragma mark - TZImagePickerControllerDelegate
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    
    // 这里为了解决TZImagePickerController选取图片dismiss后状态栏不显示的问题,效果不是太好
    UIViewController *vc = [UIViewController new];
    [self presentViewController:vc animated:NO completion:^{
        [vc dismissViewControllerAnimated:NO completion:nil];
    }];

    NSLog(@"%@", photos);
}

@end
