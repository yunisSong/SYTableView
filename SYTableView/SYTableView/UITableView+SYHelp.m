//
//  UITableView+SYHelp.m
//  MagicCode
//
//  Created by Yunis on 17/5/4.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import "UITableView+SYHelp.h"
#import <objc/runtime.h>
static const void *UITableViewHelpKey = &UITableViewHelpKey;

@implementation UITableView (SYHelp)
- (void)addHelper:(void(^)(SYTableViewHelper *help))block
{
    self.dataSource = self.help;
    self.delegate = self.help;
    block(self.help);
}

- (SYTableViewHelper *)help
{
    SYTableViewHelper *help = objc_getAssociatedObject(self, UITableViewHelpKey);
    if (!help)
    {
        help = [[SYTableViewHelper alloc] init];
        objc_setAssociatedObject(self, UITableViewHelpKey, help, OBJC_ASSOCIATION_RETAIN);
    }
    return help;
}

- (void)setHelp:(SYTableViewHelper *)help
{
    objc_setAssociatedObject(self, UITableViewHelpKey, help, OBJC_ASSOCIATION_RETAIN);
}

@end
