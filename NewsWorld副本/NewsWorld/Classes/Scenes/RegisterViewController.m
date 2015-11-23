//
//  RegisterViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "RegisterViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface RegisterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailText;

@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *pswText;
- (IBAction)registerBtn:(UIButton *)sender;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)registerBtn:(UIButton *)sender {
    
    AVUser *user =[AVUser user];
    
    user.email = self.emailText.text;
    user.username = self.nameText.text;
    user.password = self.pswText.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"注册成功");
        }else{
            NSLog(@"注册失败");
        }
    }];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
