Pod::Spec.new do |s|
  s.name             = "DBEmptyState"
  s.version          = "0.1.0"
  s.summary          = "Empty state management for UITableView and UICollectionView."
  s.license          = "MIT"
  s.platform         = :ios, '7.0'

  s.homepage         = "https://github.com/DevonBoyer/DBEmptyState"
  s.license          = 'MIT'
  s.author           = { "Devon Boyer" => "devonboyer94@gmail.com" }
  s.source           = { :git => "https://github.com/DevonBoyer/DBEmptyState.git", :tag => s.version }

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DBEmptyState' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true

end
