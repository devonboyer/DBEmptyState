//
//  UITableView+DBEmptyState.h
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

#import <UIKit/UIKit.h>

@protocol DBTableViewDelegateEmptyView <UITableViewDelegate>

@optional

- (BOOL)tableViewShouldDisplayEmptyView:(UITableView *)tableView;

@end

@interface UITableView (DBEmptyState)

@property (nonatomic, strong) UIView *emptyView;

@end
