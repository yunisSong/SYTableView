//
//  UIScrollView+emptyView.h
//  CMCC_CY
//
//  Created by Yunis on 16/11/18.
//  Copyright © 2016年 CMCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface UIScrollView (emptyView)

- (void) tableViewDisplayEmptyViewWithTitle:(NSString *)emptyTitle ifNecessaryForRowCount:(NSUInteger) rowCount;

- (void) tableViewDisplayTopEmptyViewWithTitle:(NSString *)emptyTitle ifNecessaryForRowCount:(NSUInteger) rowCount;

- (void) collectionViewDisplayEmptyViewWithTitle:(NSString *)emptyTitle ifNecessaryForRowCount:(NSUInteger) rowCount;
- (void)removeEmptyView;

@end
