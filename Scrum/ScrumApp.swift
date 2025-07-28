//
//  ScrumApp.swift
//  Scrum
//
//  Created by JG on 7/28/25.
//

import SwiftUI

@main
struct ScrumApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
