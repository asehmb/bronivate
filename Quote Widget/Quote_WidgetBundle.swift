//
//  Quote_WidgetBundle.swift
//  Quote Widget
//
//  Created by Ajay Sehmbi on 2025-10-05.
//

import WidgetKit
import SwiftUI

@main
struct Quote_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Quote_Widget()
        Quote_WidgetControl()
        Quote_WidgetLiveActivity()
    }
}
