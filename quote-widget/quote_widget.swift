//
//  quote_widget.swift
//  quote-widget
//
//  Created by Ajay Sehmbi on 2025-10-06.
//

import WidgetKit
import SwiftUI
import Foundation


//From ChatGPT

// Seeded random number generator
struct SeededGenerator: RandomNumberGenerator {
    private var state: UInt64
    init(seed: UInt64) { self.state = seed }
    mutating func next() -> UInt64 {
        // Simple xorshift64* algorithm
        state ^= state >> 12
        state ^= state << 25
        state ^= state >> 27
        return state &* 2685821657736338717
    }
}


struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let calendar = Calendar.current
        let currentDate = Date()

        // Load quotes from App Group
        let quotes = UserDefaults(suiteName: "group.motivational_quotes")
        let savedQuote: [String] = quotes?.stringArray(forKey: "quotes") ?? ["ERROR: No quotes received"]

        // Pick quote of the day deterministically
        let today = calendar.startOfDay(for: currentDate)
        let seed = UInt64(today.timeIntervalSince1970) + UInt64(calendar.component(.hour, from: currentDate))
        var generator = SeededGenerator(seed: seed)
        let quoteOfTheDay = savedQuote.randomElement(using: &generator)!

        // Assign quote to App Intent parameter
        let config = configuration
        config.currentQuote = quoteOfTheDay
        // Create timeline entry
        let entry = SimpleEntry(date: currentDate, configuration: config)
        entries.append(entry)

        // Schedule next refresh at the start of the next day
        let nextRefresh = calendar.date(byAdding: .hour, value: 4, to: today)!

        return Timeline(entries: entries, policy: .after(nextRefresh))
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct quote_widgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            // Background (optional)
            Color.clear

            // Quote centered
            Text(entry.configuration.currentQuote ?? "No Quote")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            // Bronivate at the bottom
            VStack {
                Spacer()
                Text("Bronivate")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity,
                           alignment: .bottom)
            }
        }
        .padding()
    }
}

struct quote_widget: Widget {
    let kind: String = "quote_widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            quote_widgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var daily_quote: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        return intent
    }
    
}

#Preview(as: .systemSmall) {
    quote_widget()
} timeline: {
    SimpleEntry(date: .now, configuration: .daily_quote)
}
