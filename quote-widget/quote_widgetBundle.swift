//
//  quote_widgetBundle.swift
//  quote-widget
//
//  Created by Ajay Sehmbi on 2025-10-06.
//

import WidgetKit
import SwiftUI

@main
struct quote_widgetBundle: WidgetBundle {
    var body: some Widget {
        quote_widget()
        quote_widgetControl()
        quote_widgetLiveActivity()
    }
}
