//
//  UIScrollView+emptyView.m
//  CMCC_CY
//
//  Created by Yunis on 16/11/18.
//  Copyright © 2016年 CMCC. All rights reserved.
//

#import "UIScrollView+emptyView.h"
#import <objc/runtime.h>
static char const * const kEmptyDataSetSource =     "emptyDataSetSource";

@implementation UIScrollView (emptyView)

- (void) collectionViewDisplayEmptyViewWithTitle:(NSString *)emptyTitle ifNecessaryForRowCount:(NSUInteger) rowCount
{
    [self tableViewDisplayEmptyViewWithTitle:emptyTitle ifNecessaryForRowCount:rowCount];
}

- (void) tableViewDisplayEmptyViewWithTitle:(NSString *)emptyTitle ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        //        self.backgroundView = [self emptyViewWithTitle:emptyTitle];
        UIView *view = [self emptyViewWithTitle:emptyTitle];
        //防止重复加载
        [view removeFromSuperview];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(- 40);
            make.centerX.equalTo(self);
            //            make.center.equalTo(self);
            make.width.equalTo(self);
        }];
        
    } else {
        [self removeEmptyView];
    }
}
- (void) tableViewDisplayTopEmptyViewWithTitle:(NSString *)emptyTitle ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        UIView *view = [self topEmptyViewWithTitle:emptyTitle];
        //防止重复加载
        [view removeFromSuperview];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self).offset(- 40);
            make.centerX.equalTo(self);
            
            make.width.equalTo(self);
        }];
        
    } else {
        [self removeEmptyView];
    }
}
- (void)removeEmptyView
{
    UIView *view = objc_getAssociatedObject(self, kEmptyDataSetSource);
    
    if (view) {
        [view removeFromSuperview];
    }
}
- (UIView *)emptyViewWithTitle:(NSString *)title
{
    UIView *view = objc_getAssociatedObject(self, kEmptyDataSetSource);
    if (!view) {
        view         = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor redColor];
        UILabel *textLable      = [[UILabel alloc] initWithFrame:CGRectZero];
        textLable.font          = [UIFont systemFontOfSize:16];
        textLable.textColor     = [UIColor blackColor];
        textLable.text          = title;
        textLable.tag = 2009;
        textLable.adjustsFontSizeToFitWidth = YES;
        textLable.textAlignment = NSTextAlignmentCenter;
        [view addSubview:textLable];
        [textLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
            make.width.equalTo(view).offset( - 20);
        }];
        objc_setAssociatedObject(self, kEmptyDataSetSource, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }else
    {
        UILabel *labe = [view viewWithTag:2009];
        labe.text = title;
    }
    return view;
}

- (UIView *)topEmptyViewWithTitle:(NSString *)title
{
    UIView *view = objc_getAssociatedObject(self, kEmptyDataSetSource);
    if (!view) {
        view         = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor clearColor];
        UILabel *textLable      = [[UILabel alloc] initWithFrame:CGRectZero];
        textLable.font          = [UIFont systemFontOfSize:16];
        textLable.textColor     = [UIColor blackColor];
        textLable.text          = title;
        textLable.tag = 2009;
        textLable.adjustsFontSizeToFitWidth = YES;
        textLable.textAlignment = NSTextAlignmentCenter;
        [view addSubview:textLable];
        [textLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
            make.width.equalTo(view).offset( - 20);
        }];
        objc_setAssociatedObject(self, kEmptyDataSetSource, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }else
    {
        //        [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //            if (obj.tag == 2009)
        //            {
        //                ((UILabel *)obj).text = title;
        //                *stop = YES;
        //            }
        //        }];
        
        UILabel *labe = [view viewWithTag:2009];
        labe.text = title;
    }
    return view;
}


@end
