//
//  FoundViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "FoundViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "DataAudio.h"
#import "AudioViewCell.h"
#import "AudioModel.h"
#import "AudioViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface FoundViewController ()
@property (strong, nonatomic) NSMutableArray *dataArray ;
@end
static NSString *cellindentfile = @"cellAudio";
@implementation FoundViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    AVUser * user = [AVUser currentUser];
    
     NSLog(@"%@",user.username);
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];
    // 数据加载
     [self addData];
     [self mjRefresh];
    // 可视化注册tableView
    [self.tableView registerNib:[UINib nibWithNibName:@"AudioViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellindentfile];
    
}
-(void)mjRefresh{
    
    // 上拉加载
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
            //重新加载数据
            [self addData];
            // 停止刷新
            [self.tableView.mj_header endRefreshing];
            // 刷新view
            [self.tableView reloadData];
       
        
    }];
    // 一进入页面就刷新
   [self.tableView.mj_header beginRefreshing];
    // 下拉加载每次加载20条数据
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       
            static int a = 40;
            [self xialapage:a];
            a+=20;
            // 刷新UI
            [self.tableView reloadData];
            // 停止刷新
            [self.tableView.mj_footer endRefreshing];
    }];
}

// 数据加载
-(void)addData{
    DataAudio *audio = [DataAudio new];
    
    [audio doDataParsing:KAudio];
    __weak typeof (self)temp = self;
    audio.avdioData = ^(NSMutableArray *dataArray){
        
        temp.dataArray = dataArray;
        
        [self.tableView reloadData];
    };
}

//

-(void)xialapage:(NSInteger)stopPage{
    NSString *str =[NSString stringWithFormat:@"http://c.3g.163.com/nc/video/home/0-%ld.html",stopPage];
    DataAudio *audio = [DataAudio new];
    [audio doDataParsing:str];
    __weak typeof (self)temp = self;
    audio.avdioData = ^(NSMutableArray *dataArray){
        temp.dataArray = dataArray;
        [self.tableView reloadData];
    };

}
// 懒加载
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
     _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AudioViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellindentfile forIndexPath:indexPath];
    __weak AudioModel *model = _dataArray[indexPath.row];
    cell.audioModel = model;
    __weak typeof(self)vc = self;
    cell.block = ^(){
            model.isPlaying = YES;
        for (int i = 0; i < _dataArray.count; i ++) {
            if (i != indexPath.row){
                AudioModel *model =  _dataArray[i];
                model.isPlaying = NO;
            }
        }
        [vc.tableView reloadData];
        
    };
   // cell.url = audioModel.m3u8_url;
    return cell;
//    if (cell == nil) {
//        cell = [[AudioViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellindentfile];
//    }
//    else
//    {
//        //删除cell的所有子视图
//        while ([cell.contentView.subviews lastObject] != nil)
//        {
//            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
//    }      //AudioViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 375;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     AudioModel *audioModel = _dataArray[indexPath.row];
    // 9.0之前使用
   
   // MPMoviePlayerViewController *movieVc=[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:audioModel.m3u8_url]];
        //弹出播放器
   //    [self.navigationController pushViewController:movieVc animated:YES];
    
//    AudioViewController *audioVC = [[AudioViewController alloc]init];
//  
//    AudioModel *audioModel = _dataArray[indexPath.row];
//    audioVC.urlStr =audioModel.m3u8_url;
//    [self.navigationController pushViewController:audioVC animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
