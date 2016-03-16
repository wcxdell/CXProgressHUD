//
//  ViewController.m
//  CXProgressHUD
//
//  Created by 王长旭 on 16/3/14.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "ViewController.h"
#import "CXProgressHUD.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"普通" forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.frame.size.width * .5f - 50, 50, 100, 50);
    
    UIButton *buttonCircle = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonCircle setBackgroundColor:[UIColor orangeColor]];
    [buttonCircle setTitle:@"进度" forState:UIControlStateNormal];
    buttonCircle.frame = CGRectMake(self.view.frame.size.width * .5f - 50, 150, 100, 50);
    
    [self.view addSubview:button];
    [self.view addSubview:buttonCircle];
    
    SEL sel = NSSelectorFromString(@"touchButton");
    SEL selCircle = NSSelectorFromString(@"touchButtonCircle");
    
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [buttonCircle addTarget:self action:selCircle forControlEvents:UIControlEventTouchUpInside];
}

- (void) touchButton{
    CXProgressHUD *hud = [[CXProgressHUD alloc] init];
    [hud show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hide];
    });
    
    NSLog(@"touch");
}

- (void) touchButtonCircle{
    
    CXProgressHUD *hud = [[CXProgressHUD alloc] init];
    hud.mode = progressModeCircle;
    [hud show];
    
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            dispatch_async(dispatch_get_main_queue(), ^{
                hud.progress = progress;
            });
            usleep(50000);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide];
        });
    });

    
    NSLog(@"touchCircle");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
