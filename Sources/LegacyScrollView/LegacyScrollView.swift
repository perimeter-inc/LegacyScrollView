//
//  LegacyScrollView.swift
//  
//
//  Created by Bruno Wide on 17/02/22.
//

import Foundation
import SwiftUI

/// a UIScrollView Wrapper for SwiftUI
public struct LegacyScrollView<Content: View>: UIViewRepresentable {

    let axis: Axis
    let showsIndicators: Bool
    var content: () -> Content

    // MARK: - UIScrollView Callbacks
    internal var onGestureShouldBegin: ((_ gestureRecognizer: UIPanGestureRecognizer, _ scrollView: UIScrollView) -> Bool)?

    // MARK: - Delegate callbacks
    internal var onScroll: ((UIScrollView) -> Void)?
    internal var onReachBottom: ((UIScrollView) -> Void)?
    internal var onReachTop: ((UIScrollView) -> Void)?
    internal var onEndDecelerating: ((UIScrollView) -> Void)?
    internal var onEndDragging: ((UIScrollView) -> Void)?

    public func makeCoordinator() -> LegacyScrollViewCoordinator<Content> {
        let ans = LegacyScrollViewCoordinator(self)
        ans.onScroll = onScroll
        ans.onReachTop = onReachTop
        ans.onReachBottom = onReachBottom
        ans.onEndDragging = onEndDragging
        ans.onEndDecelerating = onEndDecelerating
        return ans
    }

    public func makeUIView(context: Context) -> LegacyUIScrollView {
        let ans = LegacyUIScrollView(axis: axis)

        ans.onGestureShouldBegin = onGestureShouldBegin
        ans.delegate = context.coordinator
        ans.showsVerticalScrollIndicator = axis == .vertical && showsIndicators
        ans.showsHorizontalScrollIndicator = axis == .horizontal && showsIndicators
        ans.setContentOffset(.zero, animated: false)

        return ans
    }

    public func updateUIView(_ view: LegacyUIScrollView, context: Context) {
        let contentView = content()
        
        guard let hosting = view.contentViewController as? UIHostingController<Content> else {
            view.contentViewController = UIHostingController(rootView: contentView)
            return
        }

        hosting.rootView = contentView
        view.updateView()
    }
}

struct LegacyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        LegacyScrollView(.vertical, showsIndicators: true) { 
            VStack {
                ForEach(0..<500) {
                    Text("item \($0)")
                        .id($0)
                }
            }
        }.onGestureShouldBegin { pan, scroll -> Bool in
            true
        }
    }
}
