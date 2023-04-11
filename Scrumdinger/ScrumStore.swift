//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Rutu Patel on 4/11/23.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrum: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrum.data")
    }
}
