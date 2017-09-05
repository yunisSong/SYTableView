//
//  SYTableViewHelp.m
//  MagicCode
//
//  Created by Yunis on 17/5/4.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import "SYTableViewHelper.h"
#import "UIScrollView+emptyView.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface SYTableViewHelper ()

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) NSString *emptyViewTitle;

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) didSelectCellBlock selectCellBlock;
@property (nonatomic, copy) sectionIndex sectionIndex;


@property (nonatomic) NSInteger sectionCounts;
@property (nonatomic) NSInteger rowCounts;

@end

@implementation SYTableViewHelper

- (instancetype)init
{
    self = [super init];
    self.sectionCounts = 1;
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
- (numberOfSections)numberOfSections
{
    WS(weakSelf);
    return ^(NSInteger sections){
        weakSelf.sectionCounts = sections;
        return weakSelf;
    };
}
- (numberOfRows)numberOfRows
{
    
    WS(weakSelf);
    
    return ^(sectionIndex back)
    {
        weakSelf.sectionIndex = back;
        return weakSelf;
    };
    
}
- (configureCell)configureCell
{
    WS(weakSelf);
    return ^(TableViewCellConfigureBlock back)
    {
        weakSelf.configureCellBlock = back;

        return weakSelf;
    };

}
- (didSelectCell)addSelectCell
{
    WS(weakSelf);
    return ^(didSelectCellBlock back){
        weakSelf.selectCellBlock = back;
        return weakSelf;
    };
}
- (configureSource)addItem
{
    WS(weakSelf);
    return ^(NSArray *items){
        weakSelf.items = items;
        return weakSelf;
    };
}
- (cellIdentifier)addCellIdentifier
{
     WS(weakSelf);
    return ^(NSString *cellID)
    {
        weakSelf.cellIdentifier = cellID;
        return weakSelf;
    };
}
- (emptyTitle)addEmptyTitle
{
    WS(weakSelf);
    return ^(NSString *emptyTitle)
    {
        weakSelf.emptyViewTitle = emptyTitle;
        return weakSelf;
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionCounts;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.sectionIndex(section);
    if (self.emptyViewTitle)
    {
        [tableView tableViewDisplayEmptyViewWithTitle:self.emptyViewTitle
                               ifNecessaryForRowCount:count];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    self.configureCellBlock(cell, indexPath);
    return cell;
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面




@end
