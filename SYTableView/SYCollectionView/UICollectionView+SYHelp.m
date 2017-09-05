//
//  UICollectionView+SYHelp.m
//  SYTableView
//
//  Created by Yunis on 2017/9/5.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import "UICollectionView+SYHelp.h"
#import <objc/runtime.h>

static const void *UICollectionViewHelpKey = &UICollectionViewHelpKey;
@implementation UICollectionView (SYHelp)
- (void)addHelper:(void(^)(SYCollectionViewHelp *help))block
{
    self.dataSource = self.help;
    self.delegate = self.help;
    block(self.help);
}

- (SYCollectionViewHelp *)help
{
    SYCollectionViewHelp *help = objc_getAssociatedObject(self, UICollectionViewHelpKey);
    if (!help)
    {
        help = [[SYCollectionViewHelp alloc] init];
        objc_setAssociatedObject(self, UICollectionViewHelpKey, help, OBJC_ASSOCIATION_RETAIN);
    }
    return help;
}

- (void)setHelp:(SYCollectionViewHelp *)help
{
    objc_setAssociatedObject(self, UICollectionViewHelpKey, help, OBJC_ASSOCIATION_RETAIN);
}

@end
