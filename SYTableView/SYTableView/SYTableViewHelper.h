//
//  SYTableViewHelp.h
//  MagicCode
//
//  Created by Yunis on 17/5/4.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SYTableViewHelper;
typedef void (^TableViewCellConfigureBlock)(id cell, NSIndexPath * indexPath);
typedef void (^didSelectCellBlock) (NSIndexPath * indexPath);
typedef NSInteger (^sectionIndex) (NSInteger sectionIndex);

typedef SYTableViewHelper * (^configureCell) (TableViewCellConfigureBlock);
typedef SYTableViewHelper * (^didSelectCell) (didSelectCellBlock);
typedef SYTableViewHelper * (^configureSource) (NSArray *items);
typedef SYTableViewHelper * (^cellIdentifier) (NSString *aCellIdentifier);
typedef SYTableViewHelper * (^emptyTitle) (NSString *empty);
typedef SYTableViewHelper * (^numberOfSections)(NSInteger sections);
typedef SYTableViewHelper * (^numberOfRows)(sectionIndex);

@interface SYTableViewHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (numberOfSections)numberOfSections;
- (numberOfRows)numberOfRows;

- (configureCell)configureCell;
- (didSelectCell)addSelectCell;
- (cellIdentifier)addCellIdentifier;
- (emptyTitle)addEmptyTitle;


@end
