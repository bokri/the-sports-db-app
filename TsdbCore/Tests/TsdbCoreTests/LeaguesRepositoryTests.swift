//
//  LeaguesRepositoryTests.swift
//
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import XCTest
import SwiftData
@testable import TsdbCore

/**
 Unit tests for the `LeaguesRepository` class.
 */
class LeaguesRepositoryTests: XCTestCase {
    
    /**
     Test the synchronization of new league data with the local league repository.
     */
    func testSync() async {
        // Create a model container configuration for in-memory testing
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // Create a model container for the `LeagueModel` type with the specified configuration
        let container = try! ModelContainer(for: LeagueModel.self, configurations: config)
        
        // Create a model context for data access
        let modelContext = ModelContext(container) // You can use a mock context for testing
        
        // Create a mock data access object for `LeagueModel`
        let mockDataAccessObject = MockDataAccessObject<LeagueModel>(context: modelContext)
        
        // Create a leagues repository with the mock data access object
        let leaguesRepository = LeaguesRepository(dao: mockDataAccessObject)
        
        // Create some sample LeagueModel objects
        let league1 = LeagueModel(id: "1", name: "League 1", sport: "Soccer", alternativeName: "L1")
        let league2 = LeagueModel(id: "2", name: "League 2", sport: "Soccer", alternativeName: "L2")
        let league3 = LeagueModel(id: "3", name: "League 3", sport: "Soccer", alternativeName: "L3")
        
        
        // Put the LeagueModel objects in an array
        let leagueModels: [LeagueModel] = [league1, league2, league3]
        
        // Set the desired return value for getAll to return the sample LeagueModels
        mockDataAccessObject.getAllReturnValue = leagueModels
        
        // Create two new LeagueModel objects
        let league4 = LeagueModel(id: "4", name: "League 4", sport: "Soccer", alternativeName: "L4")
        let league5 = LeagueModel(id: "5", name: "League 5", sport: "Soccer", alternativeName: "L5")
        
        // Create an array of new LeagueModels
        let newLeagueModels: [LeagueModel] = [league4, league5]
        
        // Call the sync function with the new LeagueModels
        await leaguesRepository.sync(newLeagueModels)
        
        // Assert that the create and save functions are called as expected
        XCTAssertTrue(mockDataAccessObject.createCalled, "create should be called")
        XCTAssertTrue(mockDataAccessObject.saveCalled, "save should be called")
    }
}
