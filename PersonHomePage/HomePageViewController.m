//
//  HomePageViewController.m
//  PersonHomePage
//
//  Created by Lv on 16/7/26.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageHeaderView.h"
#import "UIView+frame.h"

#define Scr_W [UIScreen mainScreen].bounds.size.width
#define Scr_H [UIScreen mainScreen].bounds.size.height
@interface HomePageViewController ()
/**
 *  顶部imageView
 */
@property (nonatomic, strong)UIImageView * topImageView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHeaderView];
    //创建头部image
    [self setUpHeaderScaleImage];
    




}
- (void)setUpHeaderScaleImage
{

    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    topView.backgroundColor = [UIColor clearColor];
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    //锚点
//    _topImageView.layer.anchorPoint = CGPointMake(0.5, 0);
    _topImageView.backgroundColor = [UIColor whiteColor];
    _topImageView.layer.cornerRadius = _topImageView.bounds.size.width * 0.5;
    _topImageView.layer.masksToBounds = YES;
    _topImageView.image = [UIImage imageNamed:@"user_Image"];
    [topView addSubview:_topImageView];
    self.navigationItem.titleView = topView;
    
    
    
}
- (void)setUpHeaderView
{
    HomePageHeaderView * headerV = [[NSBundle mainBundle] loadNibNamed:@"HomePageHeaderView" owner:nil options:nil].lastObject;

//    headerV.backgroundColor = [UIColor clearColor];
    headerV.frame = CGRectMake(0, 0, Scr_W, 170);
    
    self.tableView.tableHeaderView = headerV;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, Scr_W, 150);

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat contentSet = scrollView.contentOffset.y + self.tableView.contentInset.top;

    if (contentSet >= 0 && contentSet <= 30) {
        _topImageView.transform = CGAffineTransformMakeScale(1 - contentSet/64, 1-contentSet/64);
        _topImageView.y = 0;
    } else if (contentSet > 30) {
        _topImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        _topImageView.y = 0;
    } else if (contentSet < 0 ) {
        _topImageView.transform = CGAffineTransformMakeScale(1, 1);
        _topImageView.y = 0;
    }
}

#pragma mark - tableView代理
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
@end

