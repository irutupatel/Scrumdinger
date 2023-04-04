//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Rutu Patel on 4/4/23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
