//
//  AppIntent.swift
//  quote-widget
//
//  Created by Ajay Sehmbi on 2025-10-06.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Current Quote")
    var currentQuote: String?
}
