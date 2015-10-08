# DBEmptyState

[![CI Status](http://img.shields.io/travis/Devon Boyer/DBEmptyState.svg?style=flat)](https://travis-ci.org/Devon Boyer/DBEmptyState)
[![Version](https://img.shields.io/cocoapods/v/DBEmptyState.svg?style=flat)](http://cocoapods.org/pods/DBEmptyState)
[![License](https://img.shields.io/cocoapods/l/DBEmptyState.svg?style=flat)](http://cocoapods.org/pods/DBEmptyState)
[![Platform](https://img.shields.io/cocoapods/p/DBEmptyState.svg?style=flat)](http://cocoapods.org/pods/DBEmptyState)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DBEmptyState is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DBEmptyState'
```

## Getting Started

For a UITableView:

```objectiveC
#import <DBEmptyState/UITableView+DBEmptyState.h>
```
For a UICollectionView:

```objectiveC
#import <DBEmptyState/UICollectionView+DBEmptyState.h>
```

### Displaying the Empty State

DBEmptyState contains categories that dynamically shows an empty view when there are is no data in your table view or collection view. The empty view will be displayed whenever the table view has no cells in any section. Whenever the table view is reloaded or layed out the empty view gets updated. The frame of the empty view is updated to the bounds of the table view, to make sure it correctly adpats for all orientations and screen sizes.

There might be scenarios in which you don't want the empty view to appear. For example when the content of the list has not yet been loaded and you don't want to tell at the user that there's no data just because it has not yet been loaded.

In that case you can let your table view delegate implement the `DBTableViewDelegateEmptyView` protocol and return NO in `-tableViewShouldDisplayEmptyView:`. Whenever this value changes do a `-[UITableView reloadData]` to update the empty view.

## Author

Devon Boyer, devonboyer94@gmail.com, @devboyer

## License

DBEmptyState is available under the MIT license. See the LICENSE file for more info.
