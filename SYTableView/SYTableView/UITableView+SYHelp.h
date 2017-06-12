//
//  UITableView+SYHelp.h
//  MagicCode
//
//  Created by Yunis on 17/5/4.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTableViewHelper.h"

@interface UITableView (SYHelp)

@property(nonatomic,strong)SYTableViewHelper *help;
- (void)addHelper:(void(^)(SYTableViewHelper *help))block;
@end
