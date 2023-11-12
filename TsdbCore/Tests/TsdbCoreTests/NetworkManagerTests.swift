//
//  NetworkManagerTests.swift
//
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import TsdbCore

class NetworkManagerTests: XCTestCase {
    override func setUp() {
        HTTPStubs.removeAllStubs()
    }
    
    override func tearDown() {
        HTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    // Test fetching a list of leagues from the TSDb API
    func testFetchLeaguesList() async {
        // Stub an HTTP request to simulate the TSDb API response
        _ = stub(condition: isHost("www.thesportsdb.com")) { (_) -> HTTPStubsResponse in
            
            if let bundlePath = Bundle.module.resourcePath {
                let stubPath = URL(fileURLWithPath: bundlePath).appendingPathComponent("leaguesList.json").path
                return fixture(filePath: stubPath, headers: ["Content-Type": "application/json"])
            }
            
            return HTTPStubsResponse()
        }
        
        // Act: Fetch leagues using the NetworkManager
        do {
            let data: LeaguesList = try await NetworkManager.shared.fetchData(TheSportsDbAPIEndpoint.allLeagues, type: LeaguesList.self)
            
            
            // Assert: Verify the results
            XCTAssertEqual(data.leagues.count, 7, "Expected 7 leagues in the list")
            
            // Assertions for individual league properties
            XCTAssertEqual(data.leagues[0].idLeague, "4328", "Incorrect league ID")
            XCTAssertEqual(data.leagues[0].strLeague, "English Premier League")
            XCTAssertEqual(data.leagues[0].strSport, "Soccer")
            XCTAssertEqual(data.leagues[0].strLeagueAlternate, "Premier League, EPL", "Incorrect league name")
        } catch {
            XCTFail("Failed to fetch leagues: \(error)")
        }
    }
    
    // Test fetching a list of teams from the TSDb API
    func testFetchTeamsList() async {
        // Stub an HTTP request to simulate the TSDb API response
        _ = stub(condition: isHost("www.thesportsdb.com")) { (_) -> HTTPStubsResponse in
            
            if let bundlePath = Bundle.module.resourcePath {
                let stubPath = URL(fileURLWithPath: bundlePath).appendingPathComponent("teamsList.json").path
                return fixture(filePath: stubPath, headers: ["Content-Type": "application/json"])
            }
            
            return HTTPStubsResponse()
        }
        
        // Act: Fetch leagues using the NetworkManager
        do {
            let data: TeamsList = try await NetworkManager.shared.fetchData(TheSportsDbAPIEndpoint.allTeams(league: "English Premier League"), type: TeamsList.self)
            
            
            // Assert: Verify the results
            XCTAssertEqual(data.teams.count, 6, "Expected 6 teams in the list")
            
            // Assertions for individual team properties
            XCTAssertEqual(data.teams[0].idTeam, "133604", "Incorrect Team ID")
            XCTAssertEqual(data.teams[0].strTeam, "Arsenal")
            XCTAssertEqual(data.teams[0].strStadium, "Emirates Stadium")
            XCTAssertEqual(data.teams[0].strTwitter, "twitter.com/arsenal", "Incorrect twitter link")
        } catch {
            XCTFail("Failed to fetch teams: \(error)")
        }
    }
}
