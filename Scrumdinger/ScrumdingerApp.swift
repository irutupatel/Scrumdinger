//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Rutu Patel on 4/3/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
