//
//  HexToColor+Extension.swift
//  FlightBooking
//
//  Created by Himanshu on 4/14/23.
//

import Foundation
import SwiftUI

extension Color {

    /// Creates a Color from a hex code.
    ///
    /// Use this method to create a SwiftUI color from a hex code string.
    /// The new color preserves the adaptability of the original.
    /// For example, you can get a Color using hex as follows:
    ///
    ///     struct Box: View {
    ///         var body: some View {
    ///             Text("Hex to Color")
    ///                 .backgroud(Color.init(hex: "#89C9FF"))
    ///         }
    ///     }
    ///
    /// The `Text` view defined above changes its background
    /// color according to the given hex code
    ///
    /// > Note: Use this initializer only if you need to convert a hex code
    /// to a SwiftUI color.
    ///
    /// - Parameter hex: A hex code string
    ///   from which to create a Color.
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
