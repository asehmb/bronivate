//
//  Quote_WidgetLiveActivity.swift
//  Quote Widget
//
//  Created by Ajay Sehmbi on 2025-10-05.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Quote_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Quote_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Quote_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Quote_WidgetAttributes {
    fileprivate static var preview: Quote_WidgetAttributes {
        Quote_WidgetAttributes(name: "World")
    }
}

extension Quote_WidgetAttributes.ContentState {
    fileprivate static var smiley: Quote_WidgetAttributes.ContentState {
        Quote_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Quote_WidgetAttributes.ContentState {
         Quote_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Quote_WidgetAttributes.preview) {
   Quote_WidgetLiveActivity()
} contentStates: {
    Quote_WidgetAttributes.ContentState.smiley
    Quote_WidgetAttributes.ContentState.starEyes
}
