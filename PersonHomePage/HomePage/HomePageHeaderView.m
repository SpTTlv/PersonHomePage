//
//  HomePageHeaderView.m
//  PersonHomePage
//
//  Created by Lv on 16/7/26.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "HomePageHeaderView.h"

@implementation HomePageHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"HomePageHeaderView" owner:nil options:nil].lastObject;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
