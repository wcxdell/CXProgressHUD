//
//  CXBackView.m
//  CXProgressHUD
//
//  Created by 王长旭 on 16/3/14.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "CXBackView.h"

@implementation CXBackView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void) setup{
    self.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    self.alpha = .9f;
    self.layer.cornerRadius = 5.f;
    self.layer.masksToBounds = YES;
    [self blurEffect];
}

- (void) blurEffect{
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.bounds;
    self.layer.allowsGroupOpacity = NO;
    self.opaque = YES;
    
    [self addSubview:effectView];
}




@end
