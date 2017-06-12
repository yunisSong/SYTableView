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
typedef void (^TableViewCellConfigureBlock)(id cell, id item);
typedef void (^didSelectCellBlock) (NSIndexPath * indexPath);
typedef SYTableViewHelper * (^configureCell) (TableViewCellConfigureBlock);
typedef SYTableViewHelper * (^didSelectCell) (didSelectCellBlock);
typedef SYTableViewHelper * (^configureSource) (NSArray *items);
typedef SYTableViewHelper * (^cellIdentifier) (NSString *aCellIdentifier);
typedef SYTableViewHelper * (^emptyTitle) (NSString *empty);

@interface SYTableViewHelper : NSObject<UITableViewDelegate,UITableViewDataSource>

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;


- (configureCell)configureCell;
- (didSelectCell)addSelectCell;
- (configureSource)addItem;
- (cellIdentifier)addCellIdentifier;
- (emptyTitle)addEmptyTitle;


//后续添加
@end
