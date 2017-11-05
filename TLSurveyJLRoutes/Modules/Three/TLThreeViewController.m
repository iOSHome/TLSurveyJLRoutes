//
//  TLThreeViewController.m
//  TLSurveyJLRoutes
//
//  Created by lichuanjun on 2017/11/5.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLThreeViewController.h"

@interface TLThreeViewController ()

@end

@implementation TLThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"三";
    
    UIButton *threeButton = [[UIButton alloc] init];
    [threeButton setTitle:@"点击" forState:UIControlStateNormal];
    [threeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [threeButton setBackgroundColor:[UIColor lightGrayColor]];
    [threeButton addTarget:self action:@selector(touchTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:threeButton];
    @weakify(self);
    [threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(60));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//第三模块按钮点击事件
- (void)touchTap
{
    NSString *url = @"TLJLRoutesThree://TLThreeNextViewController";
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url] options:@{@"name":@"JLRoutesThree"} completionHandler:nil];
}

@end
