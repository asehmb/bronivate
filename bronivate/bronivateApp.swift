//
//  bronivateApp.swift
//  bronivate
//
//  Created by Ajay Sehmbi on 2025-10-05.
//

import SwiftUI

@main
struct bronivateApp: App {
    let quotesArray: [String] = [" I love Lebron", "J Cole the goat", "Love Yourz", "Whatever you gon do, you wont do it partially"]
    let quotes = UserDefaults(suiteName: "group.motivational_quotes")
    init() {
        quotes?.set(quotesArray, forKey: "quotes")
        quotes?.synchronize()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
