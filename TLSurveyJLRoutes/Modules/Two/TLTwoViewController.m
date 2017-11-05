//
//  TLTwoViewController.m
//  TLSurveyJLRoutes
//
//  Created by lichuanjun on 2017/11/5.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLTwoViewController.h"

@interface TLTwoViewController ()

@end

@implementation TLTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"二";
    
    UIButton *twoButton = [[UIButton alloc] init];
    [twoButton setTitle:@"点击" forState:UIControlStateNormal];
    [twoButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [twoButton setBackgroundColor:[UIColor lightGrayColor]];
    [twoButton addTarget:self action:@selector(touchTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoButton];
    @weakify(self);
    [twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(60));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//第二模块按钮点击事件
- (void)touchTap
{
    NSString *url = @"TLJLRoutesTwo://TLTwoNextViewController";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:nil completionHandler:nil];
}

@end
