//
//  ContentView.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import SwiftUI
import SwiftData
import TsdbCore

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        LeaguesListView(modelContext: modelContext)
            .environment(\.modelContext, modelContext)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: LeagueModel.self, configurations: config)

    return ContentView()
        .modelContainer(container)
}
