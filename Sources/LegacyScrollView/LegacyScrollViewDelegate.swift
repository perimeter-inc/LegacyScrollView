//
//  File.swift
//  
//
//  Created by Bruno Wide on 17/02/22.
//

import Foundation
import SwiftUI
import UIKit

public class LegacyScrollViewCoordinator<Content: View>: NSObject, UIScrollViewDelegate {
    let legacyScrollView: LegacyScrollView<Content>

    var onScroll: ((UIScrollView) -> Void)?
    var onReachBottom: ((UIScrollView) -> Void)?
    var onReachTop: ((UIScrollView) -> Void)?
    var onEndDecelerating: ((UIScrollView) -> Void)?
    var onEndDragging: ((UIScrollView) -> Void)?

    init(_ legacyScrollView: LegacyScrollView<Content>) {
        self.legacyScrollView = legacyScrollView
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onScroll?(scrollView)
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onEndDecelerating?(scrollView)
        callReachBottomOrTopIfNeeded(scrollView)
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        onEndDragging?(scrollView)
    }

    private func callReachBottomOrTopIfNeeded(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            onReachBottom?(scrollView)
        } else if (scrollView.contentOffset.y <= 0) {
            onReachTop?(scrollView)
        }
    }
}
