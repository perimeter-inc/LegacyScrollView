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

    internal init(axis: Axis, showsIndicators: Bool, content: Content) {
        self.init(axis: axis, showsIndicators: showsIndicators,
                  content: content, uiScrollView: LegacyUIScrollView(),
                  onGestureShouldBegin: nil, onScroll: nil, onReachBottom: nil,
                  onReachTop: nil, onEndDecelerating: nil, onEndDragging: nil)
    }

    internal init(axis: Axis, showsIndicators: Bool, content: Content,
                  uiScrollView: LegacyUIScrollView,
                  onGestureShouldBegin: ((UIPanGestureRecognizer, UIScrollView) -> Bool)?,
                  onScroll: ((UIScrollView) -> Void)?,
                  onReachBottom: ((UIScrollView) -> Void)?,
                  onReachTop: ((UIScrollView) -> Void)?,
                  onEndDecelerating: ((UIScrollView) -> Void)?,
                  onEndDragging: ((UIScrollView) -> Void)?) {
        self.axis = axis
        self.showsIndicators = showsIndicators
        self.content = content
        self.uiScrollView = uiScrollView
        self.onGestureShouldBegin = onGestureShouldBegin
        self.onScroll = onScroll
        self.onReachBottom = onReachBottom
        self.onReachTop = onReachTop
        self.onEndDecelerating = onEndDecelerating
        self.onEndDragging = onEndDragging
    }

    /**
     overrides `UIScrollView`'s  `gestureRecognizerShouldBegin(_:)`
     */
    public func onDragShouldBegin(_ onGestureShouldBegin: @escaping (UIPanGestureRecognizer, UIScrollView) -> Bool) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         uiScrollView: uiScrollView,
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
                         uiScrollView: uiScrollView,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }

    /**
     called inside `UIScrollViewDelegate` `scrollViewDidEndDragging(_:)`, if content has reached the bottom
     */
    public func onReachBottom(_ onReachBottom: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         uiScrollView: uiScrollView,
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
                         uiScrollView: uiScrollView,
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
                         uiScrollView: uiScrollView,
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
                         uiScrollView: uiScrollView,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll,
                         onReachBottom: onReachBottom,
                         onReachTop: onReachTop,
                         onEndDecelerating: onEndDecelerating,
                         onEndDragging: onEndDragging)
    }
}
