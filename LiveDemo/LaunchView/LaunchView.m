//
//  LaunchView.m
//  LiveDemo
//
//  Created by 赵张杰 on 2017/3/29.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

#import "LaunchView.h"

@interface LaunchView ()

@property (nonatomic, strong) UIView *logoView;

@end

@implementation LaunchView

- (UIBezierPath *)bezierPath {
    UIColor* strokeColor = [UIColor colorWithRed: 0.521 green: 0.521 blue: 0.521 alpha: 1];

    UIBezierPath* pathPath = [UIBezierPath bezierPath];
    [pathPath moveToPoint: CGPointMake(139.31, 29.96)];
    [pathPath addCurveToPoint: CGPointMake(129.72, 28.49) controlPoint1: CGPointMake(140.99, 28.22) controlPoint2: CGPointMake(129.72, 28.49)];
    [pathPath addLineToPoint: CGPointMake(116.15, 33.21)];
    [pathPath addCurveToPoint: CGPointMake(95.85, 33.08) controlPoint1: CGPointMake(116.15, 33.21) controlPoint2: CGPointMake(103.22, 31.93)];
    [pathPath addCurveToPoint: CGPointMake(82.2, 38.53) controlPoint1: CGPointMake(88.48, 34.23) controlPoint2: CGPointMake(86.55, 35.48)];
    [pathPath addCurveToPoint: CGPointMake(76.44, 46.71) controlPoint1: CGPointMake(77.86, 41.58) controlPoint2: CGPointMake(76.44, 46.71)];
    [pathPath addCurveToPoint: CGPointMake(70.99, 63.21) controlPoint1: CGPointMake(76.44, 46.71) controlPoint2: CGPointMake(73.39, 54.27)];
    [pathPath addCurveToPoint: CGPointMake(68.56, 79.57) controlPoint1: CGPointMake(68.58, 72.15) controlPoint2: CGPointMake(68.56, 79.57)];
    [pathPath addLineToPoint: CGPointMake(129.14, 80.07)];
    [pathPath addCurveToPoint: CGPointMake(120.47, 68.03) controlPoint1: CGPointMake(129.14, 80.07) controlPoint2: CGPointMake(125.47, 72.94)];
    [pathPath addCurveToPoint: CGPointMake(108.17, 59.49) controlPoint1: CGPointMake(115.48, 63.13) controlPoint2: CGPointMake(108.17, 59.49)];
    [pathPath addCurveToPoint: CGPointMake(111.39, 50.66) controlPoint1: CGPointMake(108.17, 59.49) controlPoint2: CGPointMake(108.17, 56.53)];
    [pathPath addCurveToPoint: CGPointMake(116.85, 41.79) controlPoint1: CGPointMake(114.61, 44.79) controlPoint2: CGPointMake(116.85, 41.79)];
    [pathPath addCurveToPoint: CGPointMake(131.66, 34.37) controlPoint1: CGPointMake(116.85, 41.79) controlPoint2: CGPointMake(124.54, 38.53)];
    [pathPath addCurveToPoint: CGPointMake(139.31, 29.96) controlPoint1: CGPointMake(138.78, 30.2) controlPoint2: CGPointMake(138.69, 30.6)];
    [pathPath closePath];
    pathPath.miterLimit = 4;
    
    pathPath.usesEvenOddFillRule = YES;
    
    [strokeColor setStroke];
    pathPath.lineWidth = 1;
    [pathPath stroke];
    
    return pathPath;

//    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(104, 37, 5, 5)];
//    [UIColor.grayColor setFill];
//    [ovalPath fill];
}

- (void)addLayerToLaunchView {
    self.logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.logoView.backgroundColor = [UIColor clearColor];
    self.logoView.center = self.center;
    [self addSubview:self.logoView];
    
    //添加layer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = [self bezierPath].CGPath;
    layer.bounds = CGPathGetBoundingBox(layer.path);
    self.backgroundColor = [UIColor colorWithRed:0.18 green:.70 blue:.90 alpha:1.0];
    layer.position = CGPointMake(self.logoView.bounds.size.width/2, self.logoView.bounds.size.height/2);
    layer.fillColor = [UIColor whiteColor].CGColor;
    [self.logoView.layer addSublayer:layer];
    
    [self performSelector:@selector(startLaunch) withObject:nil afterDelay:1.0];
}

- (void)startLaunch {
    [UIView animateWithDuration:1 animations:^{
        //先缩小logoView
        self.logoView.transform = CGAffineTransformMakeScale(.5, .5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            //无限放大
            self.logoView.transform = CGAffineTransformMakeScale(50, 50);
            self.logoView.alpha = 0;
        } completion:^(BOOL finished) {
            //最后移除
            [self.logoView removeFromSuperview];
            [self removeFromSuperview];
        }];
    }];
}

@end
