//
//  ViewController.m
//  popView
//
//  Created by MyMac on 16/1/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "ViewController.h"
#import "PopTool.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIButton *popBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _contentView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 50);
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(popViewShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _popBtn.frame = CGRectMake(0, 250, 200, 50);
    _popBtn.backgroundColor = [UIColor greenColor];
    [_popBtn addTarget:self action:@selector(closeAndBack) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)popViewShow {
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:_contentView.bounds];
    imageV.image = [UIImage imageNamed:@"popViewBg"];
    [_contentView addSubview:imageV];
    //    看看pop效果把下面这一句加上
    //    [_contentView addSubview:_popBtn];
    
    [PopTool sharedInstance].shadeBackgroundType = ShadeBackgroundTypeGradient;
    [PopTool sharedInstance].closeButtonType = ButtonPositionTypeRight;
    [[PopTool sharedInstance] showWithPresentView:_contentView animated:YES];
    
}

- (void)closeAndBack {
    [[PopTool sharedInstance] closeWithBlcok:^{
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
}

@end
