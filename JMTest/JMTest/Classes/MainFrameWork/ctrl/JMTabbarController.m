//
//  JMTabbarController.m
//  JMTest
//
//  Created by JM on 15-3-29.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "JMTabbarController.h"
#import "JMTabBar.h"
@interface JMTabbarController()
@property(nonatomic, weak) UIButton *selBtn;
@end

@implementation JMTabbarController
-(void) viewDidLoad{
    //创建自定义tabbar
    JMTabBar *tabbar = [[JMTabBar alloc]init];
    tabbar.frame = self.tabBar.frame;
    for (NSInteger i = 0; i < self.tabBar.items.count; i++){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSInteger count = self.tabBar.items.count;
        NSInteger itemWidth = self.tabBar.frame.size.width/count;
        btn.frame = CGRectMake(itemWidth*i, 0, itemWidth, tabbar.frame.size.height);
        btn.tag = i;
        NSString * imageName = [NSString stringWithFormat:@"TabBar%ld",i+1];
         NSString * imageSelName = [NSString stringWithFormat:@"TabBar%ldSel",i+1];
        
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageSelName] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:imageSelName]  forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [tabbar addSubview:btn];
    }
    
    //移除系统tabbar 添加自定义的
    [self.view addSubview:tabbar];
    [self.tabBar removeFromSuperview];
//    self.tabBar = tabbar;
    
    //设置第一项为默认选中
    self.selectedIndex = 0;
    
}
-(void) onClick:(UIButton *) btn{
    //不用seleted的原因是 只点能击一次
    self.selBtn.enabled = YES;
    btn.enabled = NO;
    self.selBtn = btn;
    self.selectedIndex = btn.tag;
    
    
}
@end
