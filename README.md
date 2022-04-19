# LegacyScrollView

A legacy UIScrollView wrapper for SwiftUI.

## Installation

### For Swift Packages

Add a dependency in your your `Package.swift`

```swift
    .package(url: "https://github.com/perimeter-inc/LegacyScrollView", from: "2.0.2")
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

## Proxy

You can use `LegacyScrollViewProxy` to perform actions on the scrollView:

### Usage

```swift
        LegacyScrollViewReader { proxy in
            LegacyScrollView(.vertical, showsIndicators: true) {
                VStack {
                    ForEach(0..<500) {
                        Text("item \($0)")
                            .legacyId($0)
                    }
                }
            }
            .onAppear { proxy.scrollToIdIfNeeded(300) }
        }
```

these are the functions you have access to:

```swift
    /// Returns the UIScrollView
    var scrollView: UIScrollView
    /// returns the content's CGRect
    func rectOfContent<ID: Hashable>(id: ID) -> CGRect?
    /// performs a scroll to a specific `CGPoint`
    func scrollTo(point: UnitPoint)
    /// performs a scroll to an item with set `legacyID`
    func scrollTo<ID: Hashable>(_ id: ID, anchor: UnitPoint = .top)
    /// performs a scroll to an item with set `legacyID` if the item is out of the visible rect
    func scrollToIdIfNeeded<ID: Hashable>(_ id: ID, anchor: UnitPoint = .top)
```
