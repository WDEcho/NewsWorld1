//
//  LoginViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "LoginViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *pswText;
- (IBAction)loginBtn:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor= [UIColor cyanColor];
//    UIView *aview = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 300)];
//    aview.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:aview];
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

- (IBAction)loginBtn:(UIButton *)sender {
    
    [AVUser logInWithUsernameInBackground:self.emailText.text password:self.pswText.text block:^(AVUser *user, NSError *error) {
        
        if (user !=nil) {
            NSLog(@"登录成功");
        }else{
            NSLog(@"登录失败");
        }
    }];
    
    // 保存当前用户
    AVUser  *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        NSLog(@"可以使用");
    }else{
        
        NSLog(@"用户不存在");
    }
}
// 
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view  endEditing:YES];
}
@end
