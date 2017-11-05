//
//  TLOneViewController.m
//  TLSurveyJLRoutes
//
//  Created by lichuanjun on 2017/11/5.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLOneViewController.h"

@interface TLOneViewController ()

@end

@implementation TLOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"一";
    
    UIButton *oneButton = [[UIButton alloc] init];
    [oneButton setTitle:@"点击" forState:UIControlStateNormal];
    [oneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [oneButton setBackgroundColor:[UIColor lightGrayColor]];
    [oneButton addTarget:self action:@selector(touchTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneButton];
    @weakify(self);
    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(60));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//第一模块按钮点击事件
- (void)touchTap
{
    NSString *url = @"TLJLRoutesOne://TLOneNextViewController/我是userID/我是pwd";
    
    //中文传输需要进行转义
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:nil completionHandler:nil];
}

@end
