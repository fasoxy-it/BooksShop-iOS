//
//  BooksShop_iOSApp.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI

@main
struct BooksShop_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Cart())
        }
    }
}
