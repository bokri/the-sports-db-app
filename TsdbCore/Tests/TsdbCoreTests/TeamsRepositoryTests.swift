//
//  TeamsRepositoryTests.swift
//
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import XCTest
import SwiftData
@testable import TsdbCore

/**
 Unit tests for the `TeamsRepository` class.
 */
class TeamsRepositoryTests: XCTestCase {
    
    /**
     Test the synchronization of new team data with the local team repository.
     */
    func testSync() async {
        // Create a model container configuration for in-memory testing
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // Create a model container for the `TeamModel` type with the specified configuration
        let container = try! ModelContainer(for: TeamModel.self, configurations: config)
        
        // Create a model context for data access
        let modelContext = ModelContext(container) // You can use a mock context for testing
        
        // Create a mock data access object for `TeamModel`
        let mockDataAccessObject = MockDataAccessObject<TeamModel>(context: modelContext)
        
        // Create a teams repository with the mock data access object
        let teamsRepository = TeamsRepository(dao: mockDataAccessObject)
        
        // Create some sample TeamModel objects
        let team1 = TeamModel(id: "1", name: "Team 1", alternativeName: "T1", foundationYear: "2023", stadium: "Stadium", stadiumDescription: "Stadium of Team 1", stadiumCapacity: "60000", website: "", facebook: "", twitter: "", instagram: "", teamDescription: "Team 1 Description", country: "Country", logo: "", banner: "")
        
        let team2 = TeamModel(id: "2", name: "Team 2", alternativeName: "T2", foundationYear: "2023", stadium: "Stadium", stadiumDescription: "Stadium of Team 2", stadiumCapacity: "60000", website: "", facebook: "", twitter: "", instagram: "", teamDescription: "Team 2 Description", country: "Country", logo: "", banner: "")
        
        let team3 = TeamModel(id: "3", name: "Team 3", alternativeName: "T3", foundationYear: "2023", stadium: "Stadium", stadiumDescription: "Stadium of Team 3", stadiumCapacity: "60000", website: "", facebook: "", twitter: "", instagram: "", teamDescription: "Team 3 Description", country: "Country", logo: "", banner: "")
        
        
        // Put the TeamModel objects in an array
        let teamModels: [TeamModel] = [team1, team2, team3]
        
        // Set the desired return value for getAll to return the sample TeamModels
        mockDataAccessObject.getAllReturnValue = teamModels
        
        // Create two new TeamModel objects
        let team4 = TeamModel(id: "4", name: "Team 4", alternativeName: "T4", foundationYear: "2023", stadium: "Stadium", stadiumDescription: "Stadium of Team 4", stadiumCapacity: "60000", website: "", facebook: "", twitter: "", instagram: "", teamDescription: "Team 4 Description", country: "Country", logo: "", banner: "")
        
        let team5 = TeamModel(id: "5", name: "Team 5", alternativeName: "T5", foundationYear: "2023", stadium: "Stadium", stadiumDescription: "Stadium of Team 5", stadiumCapacity: "60000", website: "", facebook: "", twitter: "", instagram: "", teamDescription: "Team 5 Description", country: "Country", logo: "", banner: "")
        
        // Create an array of new TeamModels
        let newTeamModels: [TeamModel] = [team4, team5]
        
        // Call the sync function with the new TeamModels
        await teamsRepository.sync(newTeamModels)
        
        // Assert that the create and save functions are called as expected
        XCTAssertTrue(mockDataAccessObject.createCalled, "create should be called")
        XCTAssertTrue(mockDataAccessObject.saveCalled, "save should be called")
    }
}
