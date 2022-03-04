//
//  File.swift
//  
//
//  Created by Bruno Wide on 26/02/22.
//

import Foundation
import SwiftUI

public struct LegacyScrollViewProxy {

    internal var getScrollView: () -> UIScrollView
    internal var getRectOfContent: (_ id: Int) -> CGRect?
    internal var performScrollToPoint: (_ point: CGPoint) -> Void
    internal var performScrollToId: (_ id: Int, _ anchor: UnitPoint) -> Void
    internal var performScrollToIdIfNeeded: (_ id: Int, _ anchor: UnitPoint) -> Void

    public var scrollView: UIScrollView { getScrollView() }

    public func rectOfContent<ID: Hashable>(id: ID) -> CGRect? {
        getRectOfContent(id.hashValue)
    }

    public func scrollTo(point: UnitPoint) {
        performScrollToPoint(CGPoint(x: point.x, y: point.y))
    }

    public func scrollTo<ID: Hashable>(_ id: ID, anchor: UnitPoint = .top) {
        performScrollToId(id.hashValue, anchor)
    }

    public func scrollToIdIfNeeded<ID: Hashable>(_ id: ID, anchor: UnitPoint = .top) {
        performScrollToIdIfNeeded(id.hashValue, anchor)
    }
}

extension LegacyScrollViewReader {
    func makeProxy(with view: LegacyUIScrollViewReader) -> LegacyScrollViewProxy {
        LegacyScrollViewProxy {
            view.scrollView!
        } getRectOfContent: { id in
            getRectOfContent(with: id, in: view)
        } performScrollToPoint: { point in
            performScrollTo(point: point, in: view)
        } performScrollToId: { id, anchor in
            performScrollTo(id, anchor: anchor, in: view)
        } performScrollToIdIfNeeded: { id, anchor in
            performScrollToIdIfNeeded(id, anchor: anchor, in: view)
        }
    }

    private func getRectOfContent(with id: Int, in view: LegacyUIScrollViewReader) -> CGRect? {
        guard
            let foundView = view.scrollView?.allSubviews.first(where: { $0.tag == id })?.superview
        else { return nil }

        return foundView.frame
    }

    private func performScrollTo(point: CGPoint, in view: LegacyUIScrollViewReader) {
        view.scrollView?.setContentOffset(point, animated: true)
    }

    public func performScrollTo(_ id: Int, anchor: UnitPoint = .top, in view: LegacyUIScrollViewReader) {
        guard let contentFrame = getRectOfContent(with: id, in: view) else { return }

        view.scrollView?.setContentOffset(contentFrame.origin, animated: true)
    }

    public func performScrollToIdIfNeeded(_ id: Int, anchor: UnitPoint = .top, in view: LegacyUIScrollViewReader) {
        guard
            let contentFrame = getRectOfContent(with: id, in: view),
            !(view.scrollView?.visibleRect ?? CGRect.null).contains(contentFrame)
        else { return }

        view.scrollView?.setContentOffset(contentFrame.origin, animated: true)
    }
}

extension UIView {
    var allSubviews: [UIView] {
        var ans: [UIView] = []

        for view in subviews {
            ans.append(view)
            ans += view.allSubviews
        }

        return ans
    }
}

public extension UIScrollView {
    var visibleRect: CGRect {
        CGRect(origin: contentOffset, size: visibleSize)
    }
}
