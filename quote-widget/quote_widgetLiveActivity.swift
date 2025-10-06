//
//  quote_widgetLiveActivity.swift
//  quote-widget
//
//  Created by Ajay Sehmbi on 2025-10-06.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct quote_widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct quote_widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: quote_widgetAttributes.self) { context in
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

extension quote_widgetAttributes {
    fileprivate static var preview: quote_widgetAttributes {
        quote_widgetAttributes(name: "World")
    }
}

extension quote_widgetAttributes.ContentState {
    fileprivate static var smiley: quote_widgetAttributes.ContentState {
        quote_widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: quote_widgetAttributes.ContentState {
         quote_widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: quote_widgetAttributes.preview) {
   quote_widgetLiveActivity()
} contentStates: {
    quote_widgetAttributes.ContentState.smiley
    quote_widgetAttributes.ContentState.starEyes
}
