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
    var content: Content
    let uiScrollView: LegacyUIScrollView

    // MARK: - UIScrollView Callbacks
    internal var onGestureShouldBegin: ((_ gestureRecognizer: UIPanGestureRecognizer, _ scrollView: UIScrollView) -> Bool)?

    // MARK: - Delegate callbacks
    internal var onScroll: ((UIScrollView) -> Void)?
    internal var onReachBottom: ((UIScrollView) -> Void)?
    internal var onReachTop: ((UIScrollView) -> Void)?
    internal var onEndDecelerating: ((UIScrollView) -> Void)?
    internal var onEndDragging: ((UIScrollView) -> Void)?

    public func makeCoordinator() -> LegacyScrollViewCoordinator<Content> {
        LegacyScrollViewCoordinator(self)
    }

    public func makeUIView(context: Context) -> UIScrollView {
        uiScrollView.onGestureShouldBegin = onGestureShouldBegin
        context.coordinator.onScroll = onScroll
        context.coordinator.onReachTop = onReachTop
        context.coordinator.onReachBottom = onReachBottom
        context.coordinator.onEndDragging = onEndDragging
        context.coordinator.onEndDecelerating = onEndDecelerating

        uiScrollView.delegate = context.coordinator

        return uiScrollView
    }

    public func updateUIView(_ uiView: UIScrollView, context: Context) {

    }

    public init(_ axis: Axis, showsIndicators: Bool = true, @ViewBuilder content: () -> Content) {
        self.init(axis: axis, showsIndicators: showsIndicators, content: content())

        uiScrollView.showsVerticalScrollIndicator = axis == .vertical && showsIndicators
        uiScrollView.showsHorizontalScrollIndicator = axis == .horizontal && showsIndicators

        let hosting = UIHostingController(rootView: content())
        hosting.view.translatesAutoresizingMaskIntoConstraints = false

        self.uiScrollView.addSubview(hosting.view)

        let constraints: [NSLayoutConstraint]
        switch self.axis {
        case .horizontal:
            constraints = [
                hosting.view.leadingAnchor.constraint(equalTo: self.uiScrollView.contentLayoutGuide.leadingAnchor),
                hosting.view.trailingAnchor.constraint(equalTo: self.uiScrollView.contentLayoutGuide.trailingAnchor),
                hosting.view.topAnchor.constraint(equalTo: self.uiScrollView.topAnchor),
                hosting.view.bottomAnchor.constraint(equalTo: self.uiScrollView.bottomAnchor),
                hosting.view.heightAnchor.constraint(equalTo: self.uiScrollView.heightAnchor)
            ]
        case .vertical:
            constraints = [
                hosting.view.leadingAnchor.constraint(equalTo: self.uiScrollView.leadingAnchor),
                hosting.view.trailingAnchor.constraint(equalTo: self.uiScrollView.trailingAnchor),
                hosting.view.topAnchor.constraint(equalTo: self.uiScrollView.contentLayoutGuide.topAnchor),
                hosting.view.bottomAnchor.constraint(equalTo: self.uiScrollView.contentLayoutGuide.bottomAnchor),
                hosting.view.widthAnchor.constraint(equalTo: self.uiScrollView.widthAnchor)
            ]
        }
        self.uiScrollView.addConstraints(constraints)
    }
}

struct LegacyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        LegacyScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(0..<100) {
                    Text("item \($0)")
                }
            }
        }
    }
}
