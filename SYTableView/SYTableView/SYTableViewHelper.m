//
//  SYTableViewHelp.m
//  MagicCode
//
//  Created by Yunis on 17/5/4.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import "SYTableViewHelper.h"
#import "UIScrollView+emptyView.h"
@interface SYTableViewHelper ()

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) NSString *emptyViewTitle;

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) didSelectCellBlock selectCellBlock;

@end

@implementation SYTableViewHelper

- (instancetype)init
{
    self = [super init];
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}

#pragma mark - Life Cycle
- (void)dealloc
{
    NSLog(@"helper dealloc");
}
#pragma mark - Public Method
//外部方法

- (configureCell)configureCell
{
    return ^(TableViewCellConfigureBlock back)
    {
        self.configureCellBlock = [back copy];

        return self;
    };

}
- (didSelectCell)addSelectCell
{
    return ^(didSelectCellBlock back){
        self.selectCellBlock = [back copy];
        return self;
    };
}
- (configureSource)addItem
{
    return ^(NSArray *items){
        self.items = items;
        return self;
    };
}
- (cellIdentifier)addCellIdentifier
{
    return ^(NSString *cellID)
    {
        self.cellIdentifier = cellID;
        return self;
    };
}
- (emptyTitle)addEmptyTitle
{
    return ^(NSString *emptyTitle)
    {
        self.emptyViewTitle = emptyTitle;
        return self;
    };
}
#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.selectCellBlock) {
        self.selectCellBlock(indexPath);
    }
}
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.emptyViewTitle)
    {
        [tableView tableViewDisplayEmptyViewWithTitle:self.emptyViewTitle
                               ifNecessaryForRowCount:self.items.count];
    }
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面




@end
