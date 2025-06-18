//
//  Color.swift
//  RecipeBook
//
//  Created by Mac on 18/6/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue >> 16) & 0xff) / 255
        let g = Double((rgbValue >> 8) & 0xff) / 255
        let b = Double(rgbValue & 0xff) / 255

        self.init(red: r, green: g, blue: b)
    }
}
