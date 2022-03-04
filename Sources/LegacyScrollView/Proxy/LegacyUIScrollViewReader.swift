//
//  File.swift
//  
//
//  Created by Bruno Wide on 03/03/22.
//

import Foundation
import UIKit
import SwiftUI

public class LegacyUIScrollViewReader: UIView {

    // MARK: - SwiftUI updates

    var contentViewController: UIViewController! {
        willSet { assert(contentViewController == nil, "you should only set this once") }
        didSet { attach() }
    }

    var contentView: UIView { contentViewController.view }
    var scrollView: UIScrollView? {
        viewWithTag(LegacyUIScrollView.viewTag) as? UIScrollView
    }

    private func attach() {
        guard
            let contentViewController = contentViewController,
                contentViewController.parent == nil
        else {
            return
        }

        backgroundColor = .clear
        addSubview(contentView)
        contentView.sizeToFit()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(contentConstraints)
    }

    private lazy var contentConstraints: [NSLayoutConstraint] = {
        [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]
    }()

    func updateView() {
        
    }
}

private extension CGSize {
    static var greatest = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
}
