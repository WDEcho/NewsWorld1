//
//  PassWordViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "PassWordViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface PassWordViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailText;
- (IBAction)yanzheng:(UIButton *)sender;

@end

@implementation PassWordViewController

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

- (IBAction)yanzheng:(UIButton *)sender {
    [AVUser requestPasswordResetForEmailInBackground:self.emailText.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"发送成功");
        }
        
    }];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
