//
//  TabBar.swift
//  FlynautDemo
//
//  Created by Pravin Deshmukh on 09/07/23.
//

import Foundation
import UIKit

extension UITabBarItem {
    func applyCustomSelectedStyle() {
        guard let title = self.title else { return }

        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 12)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.blue,
            .font: UIFont.boldSystemFont(ofSize: 12)
        ]

        self.setTitleTextAttributes(normalAttributes, for: .normal)
        self.setTitleTextAttributes(selectedAttributes, for: .selected)

        self.setBadgeTextAttributes(normalAttributes, for: .normal)
        self.setBadgeTextAttributes(selectedAttributes, for: .selected)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 2

        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 12),
            .paragraphStyle: paragraphStyle
        ]

        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 12),
            .paragraphStyle: paragraphStyle,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        self.setTitleTextAttributes(textAttributes, for: .normal)
        self.setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
}
