//
//  UICollectionView+SYHelp.h
//  SYTableView
//
//  Created by Yunis on 2017/9/5.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYCollectionViewHelp.h"
@interface UICollectionView (SYHelp)
@property(nonatomic,strong)SYCollectionViewHelp *help;
- (void)addHelper:(void(^)(SYCollectionViewHelp *help))block;
@end
