//
//  HostViewController.m
//  A简新闻
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "HostViewController.h"
#import "NewsTableViewController.h"
@interface HostViewController ()<ViewPagerDelegate,ViewPagerDataSource>

@property (nonatomic, strong) NSArray * array;
@end

@implementation HostViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动画" image:[UIImage imageNamed:@"cinema"] tag:1001];
        
    }
    return self;
}


- (void)viewDidLoad {
   
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.dataSource = self;
    self.delegate = self;
    self.array = @[@"头条",@"娱乐",@"体育",@"军事",@"游戏"];
   
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return self.array.count;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15.0];
    label.text = [NSString stringWithFormat:@"%@", self.array[index]];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    NewsTableViewController *newsVC = [[NewsTableViewController alloc]init];
    
    newsVC.index = index;
    return newsVC;
}

#pragma mark - ViewPagerDelegate
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            break;
        default:
            break;
    }
    
    return color;
}
- (IBAction)leftBtn:(UIBarButtonItem *)sender {
    
    
    [self.mm_drawerController toggleDrawerSide:(MMDrawerSideLeft) animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
