//
//  ReadingViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "ReadingViewController.h"
#import "DataNBABase.h"
#import "DataNBA.h"
#import "NBAViewCell.h"
#import "NBAWebViewController.h"
@interface ReadingViewController ()
@property (strong,nonatomic) NSMutableArray *dataArray;
@end
static NSString *cellindentfile = @"cellnab";
@implementation ReadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 数据加载
    [self data];
    [self mjRefresh];
    self.view.backgroundColor = [UIColor cyanColor];
    // 注册可视化cell
    [self.tableView registerNib:[UINib nibWithNibName:@"NBAViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellindentfile];
}

// 数据加载
-(void)data{
    // 调用网络检测管理单例方法开始检测网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 网络状态改变时的回调
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /**
         AFNetworkReachabilityStatusUnknown          = -1,  // 未知
         AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
         AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
         AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
         */
        // 没有网络时候调用本地的数据显示
        if (status ==AFNetworkReachabilityStatusNotReachable) {
            
            DataNBABase *base =[DataNBABase new];
            NSMutableArray *nbaArray= [base selectNBAdata];
            _dataArray =nbaArray;
            
            [self.tableView reloadData];
            // 有网络连接
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi ){
            DataNBA *nba=[DataNBA new];
            [nba doDataParsing:KNBA];
            __weak typeof (self)temp = self;
            nba.dataPars=^(NSMutableArray *array){
                _dataArray = array;
                [temp.tableView reloadData];
            };
        }
    }];
    
}

 // 数据刷新
-(void)mjRefresh{
    
    // 上拉加载
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self data];
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
-(void)xialapage:(NSInteger)stopPage{
    NSString *str =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348649145984/0-%ld.html",stopPage];
    DataNBA *nba=[DataNBA new];
    [nba doDataParsing:str];
    __weak typeof (self)temp = self;
    nba.dataPars=^(NSMutableArray *array){
        _dataArray = array;
        [temp.tableView reloadData];
    };
    
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
    NBAViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellindentfile forIndexPath:indexPath];

    NBAModel *model = _dataArray[indexPath.row];
    cell.model = model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}


//点击cell到详情页面webView

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NBAWebViewController *nbaVC =[[NBAWebViewController alloc]init];
     NBAModel *model = _dataArray[indexPath.row];
    nbaVC.urlStr = model.url;
    //UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:nbaVC];
    //[self presentViewController:nav animated:YES completion:nil];
    [self.navigationController pushViewController:nbaVC animated:YES];
    
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
