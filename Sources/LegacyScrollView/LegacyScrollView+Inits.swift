//
//  File.swift
//  
//
//  Created by Bruno Wide on 22/02/22.
//

import Foundation
import UIKit
import SwiftUI

extension LegacyScrollView {

    // MARK: - Public
    public init(_ axis: Axis = .vertical, showsIndicators: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.init(axis: axis, showsIndicators: showsIndicators, content: content)
    }

    // MARK: - Internal 
    internal init(axis: Axis, showsIndicators: Bool, content: @escaping () -> Content) {
        self.init(axis: axis, showsIndicators: showsIndicators, content: content,
                  onGestureShouldBegin: nil, onScroll: nil, onReachBottom: nil,
                  onReachTop: nil, onEndDecelerating: nil, onEndDragging: nil)
    }
}
