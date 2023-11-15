//
//  TheSportsDBApp.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import SwiftUI
import SwiftData
import TsdbCore

/**
 The main entry point of the The Sports Database (TSDb) SwiftUI app.

 The `TheSportsDBApp` structure is the starting point of the SwiftUI app, which initializes the core components of the app and defines the app's main scene.

 - Note: This structure initializes a `ModelContainer` for managing persistent data storage using the SwiftData framework, including the schemas and model configurations required for storing and retrieving data related to the app's leagues listings.
*/
@main
struct TheSportsDBApp: App {
    
    // MARK: - Properties
    
    /// A shared ModelContainer for managing persistent data storage.
    var sharedModelContainer: ModelContainer = {
        let schemas = Schema([
            LeagueModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schemas, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schemas, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    // MARK: - SwiftUI

    /// The entry point for defining the app's main scene.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(sharedModelContainer)
    }
}
