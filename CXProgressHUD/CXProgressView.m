//
//  CXProgressView.m
//  CXProgressHUD
//
//  Created by 王长旭 on 16/3/15.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "CXProgressView.h"

@implementation CXProgressView

- (instancetype) init{
    return [self initWithFrame:CGRectMake(0, 0, 37, 37)];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _progress = 0.f;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setProgress:(float)progress{
    _progress = progress;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat lineWidth = 2.f;
    UIBezierPath *progressPath = [UIBezierPath bezierPath];
    progressPath.lineWidth = lineWidth;
    progressPath.lineCapStyle = kCGLineCapRound;
    
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGFloat radius = (self.bounds.size.width - lineWidth * 2) * .5f;
    CGFloat startAngle = -(M_PI * .5f);
    CGFloat endAngle = (2 * M_PI) + startAngle;
    [progressPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [[UIColor lightGrayColor] set];
    [progressPath stroke];
    
    UIBezierPath *progress = [UIBezierPath bezierPath];
    progress.lineWidth = lineWidth;
    progress.lineCapStyle = kCGLineCapRound;
    
    endAngle = _progress * 2 * M_PI + startAngle;
    [progress addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [[UIColor darkGrayColor] set];
    [progress stroke];
}


@end




















