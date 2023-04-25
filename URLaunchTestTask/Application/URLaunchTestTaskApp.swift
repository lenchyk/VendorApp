//
//  URLaunchTestTaskApp.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import SwiftUI
import SDWebImageSVGCoder

@main
struct URLaunchTestTaskApp: App {
    let svgCoder = SDImageSVGCoder.shared
    
    init() {
        setupDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            VendorListView()
        }
    }
    
    func setupDependencies() {
        SDImageCodersManager.shared.addCoder(svgCoder)
    }
}
