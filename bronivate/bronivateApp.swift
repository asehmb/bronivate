//
//  bronivateApp.swift
//  bronivate
//
//  Created by Ajay Sehmbi on 2025-10-05.
//

import SwiftUI

@main
struct bronivateApp: App {
    let quotesArray: [String] = ["I like criticism. It makes you strong",
                                 "Love Yourz", "Whatever you gon do, don't do it partially",
                                 "Something just doesn't pop under your nose; you have to work for it",
                                 "You can't be afraid to fail. It's the only way you succeed",
                                 "All the people that were rooting on me to fail, at the end of the day, they have to wake up tomorrow and have the same life that they had before",
                                 "I'm going to use all my tools, my God-given ability, and make the best life I can with it",
    "Anything's possible, you gotta dream like you never seen obstacles",
    "Don't let bridges you cross be bridges you burn",
    "We got dreams and we got the right to chase ’em.",
    "Hard to move on when you always regret one.",
    "Sometimes our dreams come true, sometimes our fears do too.",
    "If you truly believe it, that's step one. Step two, is, you know, the hard work that goes along with it.",
    "Funny how so close can feel so far",
    "They say time is money but really, it’s not. If we ever go broke, time is all we got.",
    "If they don’t know your dreams, they can’t shoot them down.",
    "Whatever is in your path and in your heart, you need to do.",
    "Never give up until you’ve given out all your very best. It’s better to fail trying, than wondering what could have happened if you tried."]
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
