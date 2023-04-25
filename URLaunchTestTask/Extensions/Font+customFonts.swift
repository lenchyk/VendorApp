//
//  Font+customFonts.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 24.04.2023.
//

import Foundation
import SwiftUI

extension Font {
    enum OpenSans {
        static var bold: (CGFloat) -> Font = { size in
            return Font.custom("OpenSans-Bold", size: size)
        }
        static var regular: (CGFloat) -> Font = { size in
            return Font.custom("OpenSans-Regular", size: size)
        }
    }
}
