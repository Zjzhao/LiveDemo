//
//  JJLiveViewController.m
//  LiveDemo
//
//  Created by 赵张杰 on 2017/3/31.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

#import "JJLiveViewController.h"
#import "AWAVCaptureManager.h"

@interface JJLiveViewController ()<AWAVCaptureDelegate>

@property (nonatomic, strong) AWAVCaptureManager *captureManager;
@property (nonatomic, strong) UIView *preView;

@end

@implementation JJLiveViewController

-(AWAVCaptureManager *)captureManager{
    if (!_captureManager) {
        _captureManager = [[AWAVCaptureManager alloc] init];
        
        //下面的3个类型必须设置，否则获取不到AVCapture
        _captureManager.captureType = AWAVCaptureTypeGPUImage;
        _captureManager.audioEncoderType = AWAudioEncoderTypeHWAACLC;
        _captureManager.videoEncoderType = AWVideoEncoderTypeHWH264;
        _captureManager.audioConfig = [[AWAudioConfig alloc] init];
        _captureManager.videoConfig = [[AWVideoConfig alloc] init];
        
        //竖屏推流
        _captureManager.videoConfig.orientation = UIInterfaceOrientationPortrait;
    }
    return _captureManager;
}

-(UIView *)preView{
    if (!_preView) {
        _preView = [UIView new];
        _preView.frame = self.view.bounds;
        [self.view addSubview:_preView];
        [self.view sendSubviewToBack:_preView];
    }
    return _preView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    AWAVCapture *capture = self.captureManager.avCapture;
    capture.stateDelegate = self;
    [self.preView addSubview:capture.preview];
    capture.preview.center = self.preView.center;
    
}

#pragma mark - AWAVCaptureDelegate

-(void) avCapture:(AWAVCapture *)capture stateChangeFrom:(aw_rtmp_state) fromState toState:(aw_rtmp_state) toState {
    
}

@end
