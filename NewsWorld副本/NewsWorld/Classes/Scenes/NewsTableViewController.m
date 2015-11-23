//
//  NewsTableViewController.m
//  NewsWorld
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wd.com. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsTableViewCell.h"
#import "NewsImageTableViewCell.h"
#import "TopTitle.h"
#import "DataBase.h"
#import "WebViewViewController.h"


@interface NewsTableViewController ()

//
// @property (strong,nonatomic) NSArray *array;
@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic) NSMutableArray *imageArray;
@end
static NSString *indentfile = @"cellindent";
static NSString *inde =@"celldemnt";
@implementation NewsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    // 导航控条颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    // 加载数据
    [self comusdata];
    // 刷新加载数据
    [self mjRefresh];

    // 轮播图
   
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
        bView.backgroundColor = [UIColor brownColor];
      self.tableView.tableHeaderView = bView;
    
    // 注册tableView
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:indentfile];
    
   [self.tableView registerClass:[NewsImageTableViewCell class] forCellReuseIdentifier:inde];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell " bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellindent"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"NewsImageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellindent"];
}

-(void)mjRefresh{
    
    // 上拉加载
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
      
            //重新加载数据
            [self comusdata];
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
            [self addDatalong:0 andStopPage:a];
            a+=20;
            // 刷新UI
            [self.tableView reloadData];
            // 停止刷新
            [self.tableView.mj_footer endRefreshing];
       
    }];
    
    
}

// 下拉加载
-(void)addDatalong:(NSInteger)startpage andStopPage:(NSInteger)stopPage{
    
    DataBase *dataBase = [DataBase new];
    // 头条
    NSString *ktop = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/headline/T1348647853363/%ld-%ld.html",startpage,stopPage];
   // 娱乐
     NSString *kplay = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648517839/%ld-%ld.html",startpage,stopPage];
   // 体育
    NSString *ksport =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348649079062/%ld-%ld.html",startpage,stopPage];
   // 军事
     NSString *kmlitary =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648141035/%ld-%ld.html",startpage,stopPage];
   //  游戏
    NSString *kgame =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348654151579/%ld-%ld.html",startpage,stopPage];
    switch (self.index) {
        case 0:
            [dataBase doDataParsing:ktop];
            break;
        case 1:
            [dataBase doDataParsing:kplay];
            break;
        case 2:
            [dataBase doDataParsing:ksport];
            break;
        case 3:
            [dataBase doDataParsing:kmlitary];
            break;
        case 4:
            [dataBase doDataParsing:kgame];
            break;
        default:
            break;
    }
    __weak typeof (self)temp = self;
    
    dataBase.dataPars = ^(NSMutableArray *contentArray){
        
        _dataArray = contentArray;
        
        [temp.tableView reloadData];
    };
    
//    dataBase.imagePars =^(NSMutableArray *imageArray){
//        _imageArray = imageArray;
//        NSLog(@"%@",_imageArray);
//        [temp.tableView reloadData];
//    };
    

    
}

// 数据加载
-(void)comusdata{
    DataBase *dataBase = [DataBase new];
    
    switch (self.index) {
        case 0:
            [dataBase doDataParsing:KTop];
            [dataBase doImages:KTop];
            
            break;
        case 1:
            [dataBase doDataParsing:KPlay];
            [dataBase doImages:KTop];
            break;
        case 2:
            [dataBase doDataParsing:KSport];
            
            [dataBase doImages:KTop];
            break;
        case 3:
            [dataBase doDataParsing:KMilitary];
            
            [dataBase doImages:KTop];
            break;
        case 4:
            [dataBase doDataParsing:KGame];
            
            [dataBase doImages:KTop];
            break;
        default:
            break;
    }
    
    __weak typeof (self)temp = self;
    
    dataBase.dataPars = ^(NSMutableArray *contentArray){
        
        _dataArray = contentArray;
        
        [temp.tableView reloadData];
        
    };
    
    dataBase.imagePars =^(NSMutableArray *imageArray){
        
        _imageArray = imageArray;
        SDCycleScrollView * scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 150) imageURLStringsGroup:self.imageArray];
        self.tableView.tableHeaderView = scrollView;
        [temp.tableView reloadData];
    };
    
}
-(NSMutableArray *)imageArray{
    
    if (!_imageArray) {
        _imageArray =[NSMutableArray array];
    }
    return _imageArray;
}
// 数据懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray ==nil) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
    
}

// 图片懒加载
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
// 分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
       TopTitle *top = _dataArray[indexPath.row];
  if (top.imgextra == nil) {
       // 普通 cell
       NewsTableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:indentfile forIndexPath:indexPath];
       // 去除点击灰色效果
      UIView *aView = [UIView new];
      aView.backgroundColor = [UIColor clearColor];
      cell.selectedBackgroundView = aView;
     
      cell.topTitle = top;
      
      NSLog(@"%lu",(unsigned long)_imageArray.count);
       
        return cell;
       
    }else {
        // 三张图片的 cell
        NewsImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inde forIndexPath:indexPath];
       // 去除点击灰色效果
        UIView *aView = [UIView new];
        aView.backgroundColor = [UIColor clearColor];
        cell.selectedBackgroundView = aView;
        cell.topTitle = top;
 
     return cell;
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     TopTitle *top = _dataArray[indexPath.row];
    WebViewViewController *webViewVC = [[WebViewViewController alloc]init];
    webViewVC.urlStr = top.url;
    
    [self.navigationController pushViewController:webViewVC animated:YES];
    
}



//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
//    bView.backgroundColor = [UIColor brownColor];
//    return bView;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *aview = [UIView new];
//    return aview;
//}
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
