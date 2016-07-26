//
//  ViewController.m
//  PersonHomePage
//
//  Created by Lv on 16/7/26.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"
#import "HomePageViewController.h"

#define HeaderViewH 200
#define TabbarH 44
@interface ViewController ()<
UITableViewDataSource,
UITableViewDelegate
>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *HeaderViewHeight;
/**
 *  tableView初始的偏移量
 */
@property (nonatomic,assign) CGFloat oriTableViewOffsetH;
/**
 *  用户名
 */
@property (nonatomic,weak) UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setUpNavigation];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.oriTableViewOffsetH = - (TabbarH + HeaderViewH);
    self.tableView.contentInset = UIEdgeInsetsMake(TabbarH + HeaderViewH, 0, 0, 0);
}
- (void)setUpNavigation
{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"超值土土";
    [label sizeToFit];
    label.textColor = [UIColor colorWithWhite:1.0 alpha:0];
    self.label = label;
    self.navigationItem.titleView = label;
    

}
#pragma mark  - 滚动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //当前偏移量
    CGFloat currentOffset = scrollView.contentOffset.y - self.oriTableViewOffsetH;
    CGFloat HeaderH = HeaderViewH - currentOffset;
    if (HeaderH < 64) {
        HeaderH = 64;
    }
    self.HeaderViewHeight.constant = HeaderH;
    
    //透明度 200-64
    CGFloat alpha = currentOffset/136;
    if (alpha >1) {
        alpha = 0.99;
    }
    UIImage * image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    self.label.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    

}
#pragma mark = tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;

}

//主页点击
- (IBAction)HomePageClick:(id)sender {
    

    [self.navigationController pushViewController:[NSClassFromString(@"HomePageViewController") new] animated:YES];

    
}


@end
