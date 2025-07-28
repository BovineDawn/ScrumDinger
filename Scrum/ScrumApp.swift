//
//  ScrumApp.swift
//  Scrum
//
//  Created by JG on 7/28/25.
//

import SwiftUI

@main
struct ScrumApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
