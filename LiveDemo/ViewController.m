//
//  ViewController.m
//  LiveDemo
//
//  Created by 赵张杰 on 2017/3/29.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

#import "ViewController.h"
#import "LaunchView.h"
#import "LaunchScreenController.h"
#import "JJLiveViewController.h"

@interface ViewController ()

@property (nonatomic,strong) LaunchView *launchView;
@property (nonatomic, strong) LaunchScreenController *launchController;
@property (nonatomic, strong) JJLiveViewController *liveController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.launchController = [[LaunchScreenController alloc] init];
    self.liveController = [[JJLiveViewController alloc] init];
    [self addChildViewController:self.liveController];
    [self didMoveToParentViewController:self];
    NSLog(@"%@",self.liveController.view);
    [self.view addSubview:self.liveController.view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.launchController launchAnimation];
}

@end
