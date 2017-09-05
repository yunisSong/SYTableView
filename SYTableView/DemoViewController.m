//
//  DemoViewController.m
//  SYTableView
//
//  Created by Yunis on 17/6/12.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import "DemoViewController.h"
#import "UITableView+SYHelp.h"
#import "Masonry.h"
@interface DemoViewController ()
{
    UITableView *test;
}
@end

@implementation DemoViewController

static NSString * const YunisCellIdentifier = @"YunisCell";

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    test = ({
        UITableView *baseTableView    = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        baseTableView.estimatedRowHeight = 100;
        baseTableView.rowHeight = UITableViewAutomaticDimension;
        [baseTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:YunisCellIdentifier];
        baseTableView;
    });
    
    NSArray *source = @[@"君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。",@"卢家少妇郁金堂，海燕双栖玳瑁梁。九月寒砧催木叶，十年征戍忆辽阳。白狼河北音书断，丹凤城南秋夜长。谁谓含愁独不见，更教明月照流黄!",@"Yunis",@"Yunis",@"Yunis",@"Yunis",@"Yunis",];
    NSArray *sourceq = @[@"q君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。",@"e卢家少妇郁金堂，海燕双栖玳瑁梁。九月寒砧催木叶，十年征戍忆辽阳。白狼河北音书断，丹凤城南秋夜长。谁谓含愁独不见，更教明月照流黄!",@"Yzzunis",@"zxcvYunis",@" bvzxvYunis",@"gggYunis",@"Yunizzcxvzxcvzxcvs",];
    NSArray *sectionArray = @[source,sourceq];
    
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, NSIndexPath *path) {
        NSArray *sectionArray0 = sectionArray[path.section];

        NSString *title = sectionArray0[path.row];
        
        cell.textLabel.text = title;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
        
    };
    
   NSInteger (^sectionIndex) (NSInteger index) =  ^NSInteger (NSInteger index) {
       NSArray *sectionArray0 = sectionArray[index];
       return sectionArray0.count;
    };

    
    __weak __typeof(&*test)weakTest = test;

    
    didSelectCellBlock selectBack = ^(NSIndexPath *index)
    {
        NSLog(@"indexRow = %ld",(long)index.row);

        
    };
    
    [test addHelper:^(SYTableViewHelper *help)
     {
         help
         .configureCell(configureCell)
         .addSelectCell(selectBack)
         .addCellIdentifier(YunisCellIdentifier)
         .numberOfRows(sectionIndex)
         .numberOfSections(sectionArray.count);
         
     }];
    
    [self.view addSubview:test];
    
    [test mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
        
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        test.help.addItem(@[]).addEmptyTitle(@"数据是空的~");
    //        [test reloadData];
    //    });
    
    //隐藏多余的cell
    test.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件
}
- (void)dealloc
{
    test = nil;
    NSLog(@"dealloc");
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

@end
