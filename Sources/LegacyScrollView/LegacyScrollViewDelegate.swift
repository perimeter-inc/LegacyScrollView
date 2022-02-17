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

    init(_ legacyScrollView: LegacyScrollView<Content>) {
        self.legacyScrollView = legacyScrollView
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onScroll?(scrollView)
    }
}
