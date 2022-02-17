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

    internal init(axis: Axis, showsIndicators: Bool, content: Content,
                  uiScrollView: LegacyUIScrollView,
                  onGestureShouldBegin: ((UIPanGestureRecognizer, UIScrollView) -> Bool)? = nil,
                  onScroll: ((UIScrollView) -> Void)? = nil) {
        self.axis = axis
        self.showsIndicators = showsIndicators
        self.content = content
        self.uiScrollView = uiScrollView
        self.onGestureShouldBegin = onGestureShouldBegin
        self.onScroll = onScroll
    }

    public func onDragShouldBegin(_ onGestureShouldBegin: @escaping (UIPanGestureRecognizer, UIScrollView) -> Bool) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         uiScrollView: uiScrollView,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll)
    }

    public func onScroll(_ onScroll: @escaping (UIScrollView) -> Void) -> LegacyScrollView {
        LegacyScrollView(axis: axis,
                         showsIndicators: showsIndicators,
                         content: content,
                         uiScrollView: uiScrollView,
                         onGestureShouldBegin: onGestureShouldBegin,
                         onScroll: onScroll)
    }
}
