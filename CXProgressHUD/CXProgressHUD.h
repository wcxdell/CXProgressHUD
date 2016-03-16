//
//  CXProgressHUD.h
//  CXProgressHUD
//
//  Created by 王长旭 on 16/3/14.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, progressMode){
    progressModeNormal,
    progressModeCircle
};



@interface CXProgressHUD : UIView
@property (assign, nonatomic) progressMode mode;
@property (assign, nonatomic) float progress;
- (void)show;
- (void)hide;
@end
