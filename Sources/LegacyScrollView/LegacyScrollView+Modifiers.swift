//
//  File.swift
//  
//
//  Created by Bruno Wide on 17/02/22.
//

import Foundation
import SwiftUI
import UIKit

extension LegacyScrollView {

    /**
     overrides `UIScrollView`'s  `gestureRecognizerShouldBegin(_:)`
     */
    public func onGestureShouldBegin(_ onGestureShouldBegin: @escaping (UIPanGestureRecognizer, UIScrollView) -> Bool) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }

    /**
     `UIScrollViewDelegate` `scrollViewDidScroll(_:)` callback
     */
    public func onScroll(_ onScroll: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }

    /**
     called inside `UIScrollViewDelegate` `scrollViewDidEndDecelerating(_:)`, if content has reached the bottom
     */
    public func onReachBottom(_ onReachBottom: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }

    /**
     `UIScrollViewDelegate` `scrollViewDidScrollToTop(_:)` callback
     */
    public func onReachTop(_ onReachTop: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }

    /**
     `UIScrollViewDelegate` `scrollViewDidEndDecelerating(_:)` callback
     */
    public func onEndDecelerating(_ onEndDecelerating: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }

    /**
     `UIScrollViewDelegate` `scrollViewDidEndDragging(_:)` callback
     */
    public func onEndDragging(_ onEndDragging: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }
}
