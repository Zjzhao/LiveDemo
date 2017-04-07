//
//  LaunchScreenController.m
//  LiveDemo
//
//  Created by 赵张杰 on 2017/3/29.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

#import "LaunchScreenController.h"
#import "LaunchView.h"

@interface LaunchScreenController ()

@property (nonatomic,strong) LaunchView *launchView;

@end

@implementation LaunchScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)launchAnimation {
    //获取到LaunchScreen控制器(不要忘记id)
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    
    UIView *view = viewController.view;
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    view.frame = [UIApplication sharedApplication].keyWindow.frame;
    [mainWindow addSubview:view];
    
    self.launchView = [[LaunchView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.launchView addLayerToLaunchView];
    [view addSubview:self.launchView];
    
    [UIView animateWithDuration:.5f delay:2.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        view.alpha = .0f;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

@end
