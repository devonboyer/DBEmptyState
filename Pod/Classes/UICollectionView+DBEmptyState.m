//
//  UICollectionView+DBEmptyState.m
//
//
//  GitHub
//  https://github.com/DevonBoyer/DBEmptyState
//
//
//  Created by Devon Boyer on 2015-06-10.
//  Copyright (c) 2014 Devon Boyer. All rights reserved.
//
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "UICollectionView+DBEmptyState.h"
#import "ObjCRuntimeHelpers.h"

@implementation UICollectionView (DBEmptyState)

+ (void)load;
{
    Class c = [UICollectionView class];
    db_swizzle(c, @selector(reloadData), @selector(db_reloadData));
    db_swizzle(c, @selector(layoutSubviews), @selector(db_layoutSubviews));
}

- (UIView *)emptyView
{
    return objc_getAssociatedObject(self, @selector(emptyView));
}

- (void)setEmptyView:(UIView *)emptyView
{
    if (self.emptyView.superview) {
        [self.emptyView removeFromSuperview];
    }
    objc_setAssociatedObject(self, @selector(emptyView), emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self _layoutEmptyView];
}

#pragma mark - Layout

- (void)_layoutEmptyView
{
    UIView *emptyView = self.emptyView;
    
    if (!emptyView) return;
    
    if (emptyView.superview != self) {
        [self addSubview:emptyView];
        
        // Animate first appearance
        for (UIView *subview in emptyView.subviews) {
            subview.transform = CGAffineTransformMakeTranslation(0, 30);
            [UIView animateWithDuration:0.3 animations:^{
                subview.transform = CGAffineTransformIdentity;
            }];
            subview.alpha = 0;
            [UIView animateWithDuration:0.4 animations:^{
                subview.alpha = 1;
            }];
        }
    }
    
    // Setup empty view frame
    CGRect frame = self.bounds;
    frame.origin = CGPointMake(0, 0);
    frame.size.height -= (self.contentInset.top + self.contentInset.bottom);
    emptyView.frame = frame;
    emptyView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    NSUInteger numberOfItems = 0;
    for (NSInteger sectionIndex = 0; sectionIndex < self.numberOfSections; sectionIndex++) {
        numberOfItems += [self numberOfItemsInSection:sectionIndex];
    }
    
    // Check bypassing
    BOOL shouldDisplayEmptyView;
    if ([self.delegate respondsToSelector:@selector(collectionViewShouldDisplayEmptyView:)]) {
        shouldDisplayEmptyView = [(id<DBCollectionViewDelegateEmptyView>)self.delegate collectionViewShouldDisplayEmptyView:self];
    }
    
    emptyView.hidden = (numberOfItems > 0);
}

#pragma mark - Swizzle

- (void)db_reloadData;
{
    // this calls the original reloadData implementation
    [self db_reloadData];
    
    [self _layoutEmptyView];
}

- (void)db_layoutSubviews;
{
    // this calls the original layoutSubviews implementation
    [self db_layoutSubviews];
    
    [self _layoutEmptyView];
}

@end
