//
//  CXProgressHUD.m
//  CXProgressHUD
//
//  Created by 王长旭 on 16/3/14.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "CXProgressHUD.h"
#import "CXBackView.h"
#import "CXProgressView.h"
#define deviceHeight [UIScreen mainScreen].bounds.size.height
#define deviceWidth [UIScreen mainScreen].bounds.size.width

@interface CXProgressHUD()
@property (weak, nonatomic) UIWindow *window;
@property (weak, nonatomic) CXBackView *backView;
@property (strong, nonatomic) UIView *indicator;
@property (weak, nonatomic) CXProgressHUD *hud;
@end


@implementation CXProgressHUD


-(instancetype)init{
    if (self = [super init]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _mode = progressModeNormal;
        _window = window;
        self.frame = _window.bounds;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) setupView{
    [_window addSubview:self];
    
    CXBackView *backView = [[CXBackView alloc] initWithFrame:CGRectMake(deviceWidth * .5f - 75, deviceHeight * .5f - 100, 150, 100)];
    [self addSubview:backView];
    _backView = backView;
}

- (void) addIndicator{
    if (_mode == progressModeNormal) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _indicator.frame = CGRectMake(_backView.frame.size.width * .5f - 18.5f, _backView.frame.size.height * .5f - 18.5f, 37.f, 37.f);
        [(UIActivityIndicatorView *)_indicator startAnimating];
        ((UIActivityIndicatorView *)_indicator).color = [UIColor darkGrayColor];
        
    }else if(_mode == progressModeCircle){
        _indicator = [[CXProgressView alloc] initWithFrame:CGRectMake(_backView.frame.size.width * .5f - 18.5f, _backView.frame.size.height * .5f - 18.5f, 37, 37)];
    }
    [_backView addSubview:_indicator];
    
}

- (void)show{
    [self setupView];
    [self addIndicator];
}

- (void)hide{
    if ([_indicator isKindOfClass:[UIActivityIndicatorView class]]) {
        [(UIActivityIndicatorView *)_indicator stopAnimating];
    }
    [self removeFromSuperview];
}

-(void)setProgress:(float)progress{
    ((CXProgressView*)_indicator).progress = progress;
    _progress = progress;
}

@end
