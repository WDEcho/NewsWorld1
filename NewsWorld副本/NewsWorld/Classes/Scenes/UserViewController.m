//
//  UserViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "UserViewController.h"
#import "LoginViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface UserViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;



@property (strong, nonatomic) IBOutlet UIImageView *imgView;


- (IBAction)cancelBtn:(UIBarButtonItem *)sender;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource= self;
    self.imgView.layer.masksToBounds = YES;
    
    self.imgView.layer.cornerRadius = 36;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// 分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    
    return aView;
    
}
// cell显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [ self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UIView *aview =[UIView new];
    aview.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = aview;
    
    if (indexPath.row == 0) {
         cell.textLabel.text = @"我的消息";
        
    }else if (indexPath.row == 1){
        
        cell.textLabel.text = @"我的收藏";

    }else if (indexPath.row == 2){
        
         cell.textLabel.text = @"我的邮箱";
        
        
    }else{
        
        cell.textLabel.text = @"清除缓存";
    }
   
    
    return  cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 3) {
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSLog(@"%@",cachPath);
        NSArray *fileArr = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"清理内存%ldKB",fileArr.count] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"清理成功" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
            dispatch_async(dispatch_get_main_queue(), ^{
                // 清理缓存
                 [self clearCache:cachPath];
                // 刷新主线程
                 [self.tableView reloadData];
                
            });
        }];
        [alertC addAction:alertAction];
        [self presentViewController:alertC animated:YES completion:nil];
    }
}

// 清理缓存
-(void)clearCache:(NSString *)path{
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
   
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 用户注销
- (IBAction)cancelBtn:(UIBarButtonItem *)sender {
    
    [AVUser logOut];
    AVUser *currentUser = [AVUser currentUser];
    NSLog(@"%@",currentUser.username);
}
@end
