//
//  Color.swift
//  FlynautDemo
//
//  Created by Pravin Deshmukh on 09/07/23.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(hexString: String) {
        var formattedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if formattedString.hasPrefix("#") {
            formattedString.remove(at: formattedString.startIndex)
        }
        
        var hexValue: UInt64 = 0
        guard Scanner(string: formattedString).scanHexInt64(&hexValue) else {
            return nil
        }
        
        let hasAlpha = (formattedString.count > 6)
        let divisor = CGFloat(hasAlpha ? 255 : 255)
        let red = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hexValue & 0x00FF00) >> 8) / divisor
        let blue = CGFloat(hexValue & 0x0000FF) / divisor
        let alpha = hasAlpha ? CGFloat((hexValue & 0xFF000000) >> 24) / divisor : 1.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init?(r: Double, g: Double, b:Double, alpha : Double = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
}
