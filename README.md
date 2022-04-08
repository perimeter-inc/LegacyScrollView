# LegacyScrollView

A legacy UIScrollView wrapper for SwiftUI.

## Installation

### For Swift Packages

Add a dependency in your your `Package.swift`

```swift
    .package(name: "LegacyScrollView", url: "https://github.com/perimeter-inc/LegacyScrollView", from: "2.0.1")
```


## Usage:

```swift
            LegacyScrollView(.vertical, showsIndicators: true) {
                content
            }
            .onGestureShouldBegin { pan, scrollView in
                pan.translation(in: scrollView).y > 0
            }
            .onScroll { scrollView in
                print(scrollView.contentOffset.y)
            }
```

## Modifiers:

with this package you'll have access to these UIScrollView delegate callbacks

```swift
    .onScroll { scrollView in }
    .onReachBottom { scrollView in }
    .onReachTop { scrollView in }
    .onEndDecelerating { scrollView in }
    .onEndDragging { scrollView in }
```

and this UIScrollViewOverride

```swift
    .onGestureShouldBegin { panGesture, scrollView -> Bool in }
```
