//
//  LeaguesListPresenter.swift
//  TheSportdDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import SwiftUI
import SwiftData
import TsdbCore
import Combine

/// A presenter responsible for coordinating data flow between the LeaguesListView and data repositories.
@Observable
class LeaguesListPresenter {
    
    // MARK: - Properties
    
    /// A subject for observing changes in the search text.
    var searchTextSubject = PassthroughSubject<String, Never>()
    
    /// Indicates whether an error occurred during data fetching.
    var isOnError = false
    
    /// Repository for handling league-related data.
    private var leaguesRepository: LeaguesRepository
    
    /// Repository for handling team-related data.
    private var teamsRepository: TeamsRepository
    
    /// A set of cancellables to manage Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Constructors
    
    /// Initializes the presenter with the specified repositories for leagues and teams.
    /// - Parameters:
    ///   - leaguesRepository: Repository for leagues data.
    ///   - teamsRepository: Repository for teams data.
    init(leaguesRepository: LeaguesRepository, teamsRepository: TeamsRepository) {
        self.leaguesRepository = leaguesRepository
        self.teamsRepository = teamsRepository
    }
    
    // MARK: - Methods
    
    /// Observes changes in the search text and triggers a search after debouncing.
    func observeSearchChanges() {
        searchTextSubject
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self else {
                    return
                }
                Task {
                    guard query.isEmpty == false else {
                        return
                    }
                    await self.runSearch(query)
                }
            }
            .store(in: &cancellables)
    }
    
    /// Fetches the list of leagues from the network and syncs the repository.
    func getLeagues() async {
        do {
            let remoteLeagues = try await NetworkManager.shared.fetchData(TheSportsDbAPIEndpoint.allLeagues, type: LeaguesList.self).toData()
            
            leaguesRepository.sync(remoteLeagues)
            isOnError = false
        } catch {
            Logger.error("Error on Getting Leagues \(error.localizedDescription)")
            isOnError = true
        }
    }
    
    /// Fetches the list of teams for the specified league from the network and syncs the repository.
    /// - Parameter league: The name of the league for which teams are to be fetched.
    func getTeams(for league: String) async {
        do {
            let remoteTeams = try await NetworkManager.shared.fetchData(TheSportsDbAPIEndpoint.allTeams(league: league), type: TeamsList.self).toData()

            teamsRepository.sync(remoteTeams)
        } catch {
            Logger.error("Error on Getting Teams \(error.localizedDescription)")
        }
    }
    
    /// Initiates a search for teams based on the provided query.
    /// - Parameter query: The search query entered by the user.
    func runSearch(_ query: String) async {
        await getTeams(for: query)
    }
}
