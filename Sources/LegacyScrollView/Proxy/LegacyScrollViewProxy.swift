//
//  File.swift
//  
//
//  Created by Bruno Wide on 26/02/22.
//

import Foundation
import SwiftUI

public struct LegacyScrollViewProxy {

    internal var performScrollToPoint: ((_ point: CGPoint) -> Void)?

    public func scrollTo(point: UnitPoint) {
        performScrollToPoint?(CGPoint(x: point.x, y: point.y))
    }

}

extension LegacyScrollView {
    func makeProxy(with view: LegacyUIScrollView) -> LegacyScrollViewProxy {
        var proxy = LegacyScrollViewProxy()

        proxy.performScrollToPoint = { performScrollTo(point: $0, in: view) }

        return proxy
    }

    private func performScrollTo(point: CGPoint, in view: LegacyUIScrollView) {
        view.setContentOffset(point, animated: true)
    }
}

extension UIViewController {
    func allChildren<T: UIViewController>() -> [T] {
        var ans: [T] = []

        for child in children {
            ans += child.allChildren() as [T]

            if let x = child as? T {
                ans.append(x)
            }
        }

        return ans
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

    var allSubLayers: [CALayer] {
        var ans: [CALayer] = []

        for view in subviews {
            for layer in view.layer.sublayers ?? [] {
                ans.append(layer)
            }
            ans += view.allSubLayers
        }

        return ans
    }
}
