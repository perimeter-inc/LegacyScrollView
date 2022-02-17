//
//  LegacyUIScrollView.swift
//  
//
//  Created by Bruno Wide on 17/02/22.
//

import Foundation
import UIKit

class LegacyUIScrollView: UIScrollView {

    var onGestureShouldBegin: ((_ gestureRecognizer: UIPanGestureRecognizer, _ scrollView: UIScrollView) -> Bool)?

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let panGesture = gestureRecognizer as? UIPanGestureRecognizer else { return super.gestureRecognizerShouldBegin(gestureRecognizer)}
        
        return onGestureShouldBegin?(panGesture, self) ?? super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
}
