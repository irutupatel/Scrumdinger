//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Rutu Patel on 4/3/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
