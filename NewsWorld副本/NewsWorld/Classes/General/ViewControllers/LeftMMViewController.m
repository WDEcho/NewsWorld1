//
//  LeftMMViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "LeftMMViewController.h"
#import "NewsTableViewController.h"
@interface LeftMMViewController ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIView *aView;
@property (strong, nonatomic)  NewsTableViewController *newsVC;
- (IBAction)clickBtn:(UIButton *)sender;

@end

@implementation LeftMMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text= @"asdasasdsadsadsad";
    [self.view addSubview:label];
    self.label = label;
    self.aView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
   self.newsVC = [[NewsTableViewController alloc]init];
    
    [self.view addSubview:_aView];
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        self.newsVC.tableView.nightBackgroundColor =UIColorFromRGB(0x343434);
        self.newsVC.tableView.normalSeparatorColor =UIColorFromRGB(0x343434);
        
        
        self.label.normalTextColor = UIColorFromRGB(0x343434);
        self.label.nightTextColor = [UIColor whiteColor] ;
        
        self.view.normalBackgroundColor = [UIColor whiteColor];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
       
        
    }];
   
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickBtn:(UIButton *)sender {
   
    
  
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        [DKNightVersionManager dawnComing];
    } else {
        [DKNightVersionManager nightFalling];
    }
}
- (IBAction)clickswitch:(UISwitch *)sender {
    //sender.on = NO;
    NSArray *subView = self.view.window.subviews;
    UIView *aView = subView.lastObject;
    if (sender.on == YES) {
        aView.alpha = 0.45;
    } else {
        aView.alpha = 1.0;
    }

}
@end
