//
//  TLTabBarViewController.m
//  TLSurveyJLRoutes
//
//  Created by lichuanjun on 2017/11/5.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLTabBarViewController.h"
#import "TLOneViewController.h"
#import "TLTwoViewController.h"
#import "TLThreeViewController.h"

@interface TLTabBarViewController ()

@end

@implementation TLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TLOneViewController *oneVc = [[TLOneViewController alloc]init];
    UINavigationController *oneNav = [[UINavigationController alloc]initWithRootViewController:oneVc];
    [self controller:oneNav Title:@"一" tabBarItemImage:@"number1" tabBarItemSelectedImage:@"sel_number1"];
    [self registerRouteWithA:oneNav];
    
    TLTwoViewController *twoVc = [[TLTwoViewController alloc]init];
    UINavigationController *twoNav = [[UINavigationController alloc]initWithRootViewController:twoVc];
    [self controller:twoVc Title:@"二" tabBarItemImage:@"number2" tabBarItemSelectedImage:@"sel_number2"];
    [self registerRouteWithB:twoNav];
    
    TLThreeViewController *threeVc = [[TLThreeViewController alloc]init];
    UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:threeVc];
    [self controller:threeVc Title:@"三" tabBarItemImage:@"number3" tabBarItemSelectedImage:@"sel_number3"];
    [self registerRouteWithC:threeNav];
    
    self.viewControllers = @[oneNav,twoNav,threeNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 抽取成一个方法
 * 传入控制器、标题、正常状态下图片、选中状态下图片
 * 直接调用这个方法就可以了
 */
- (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage
{
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
    UIImage *imageHome = [UIImage imageNamed:selectedImage];
    imageHome = [imageHome imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setSelectedImage:imageHome];
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
}

//第一模块跳转逻辑
- (void)registerRouteWithA:(UINavigationController *)navVc
{
    [[JLRoutes routesForScheme:@"TLJLRoutesOne"]addRoute:@"/:ViewControllerOne/:userID/:pass" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters){
        
        //此处viewController key值对应的是 touch方法中的第一个值 , userID对应第二个值 , pass对应第三个 ...
        //作者github上的实现 ?userID=123&pwd=321 这种方式传递参数我没有实现 , 不知道什么原因..
        Class class = NSClassFromString(parameters[@"ViewControllerOne"]);
        
        NSLog(@"-----------userID : %@",parameters[@"userID"]);
        NSLog(@"-----------pass   : %@",parameters[@"pass"]);
        [navVc pushViewController:[[class alloc]init] animated:YES];
        NSLog(@"-------------------第一模块");
        
        self.selectedIndex = 0; //解决从app外跳转进来的tabbar选中问题
        return YES;
    }];
}

//第二模块跳转逻辑
- (void)registerRouteWithB:(UINavigationController *)navVc
{
    
    [[JLRoutes routesForScheme:@"TLJLRoutesTwo"]addRoute:@"/:ViewControllerTwo" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters){
        
        Class class = NSClassFromString(parameters[@"ViewControllerTwo"]);
        
        [navVc pushViewController:[[class alloc]init] animated:YES];
        
        NSLog(@"-------------------第二模块");
        
        self.selectedIndex = 1;
        return YES;
        
    }];
}

//第三模块跳转逻辑
- (void)registerRouteWithC:(UINavigationController *)navVc
{
    [[JLRoutes routesForScheme:@"TLJLRoutesThree"]addRoute:@"/:ViewControllerThree" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters){
        
        
        Class class = NSClassFromString(parameters[@"ViewControllerThree"]);
        
        [navVc pushViewController:[[class alloc]init] animated:YES];
        
        self.selectedIndex = 2;
        NSLog(@"-------------------第三模块");
        
        return YES;
    }];
}

@end
