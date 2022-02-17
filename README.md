# LegacyScrollView

A legacy UIScrollView wrapper for SwiftUI.

## Installation

### For Swift Packages

Add a dependency in your your `Package.swift`

```swift
    .package(name: "LegacyScrollView", url: "https://github.com/bwide/LegacyScrollView", from: "0.1.0")
```


## Usage:

```swift
            LegacyScrollView(.vertical, showsIndicators: true) {
                content
            }
            .onDragShouldBegin { pan, scrollView in
                return pan.translation(in: scrollView).y > 0
            }
            .onScroll { scrollView in
                print(scrollView.contentOffset.y)
            }
```
