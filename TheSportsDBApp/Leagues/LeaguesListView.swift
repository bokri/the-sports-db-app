//
//  LeaguesListView.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import SwiftUI
import SwiftData
import TsdbCore
import Combine

struct LeaguesListView: View {
    
    // MARK: - Properties
    
    @Environment(\.modelContext) var modelContext
    
    @State private var presenter: LeaguesListPresenter
    
    @Query private var leagues: [LeagueModel]
    @Query(sort: [SortDescriptor(\TeamModel.name)], animation: .easeInOut) 
    private var teams: [TeamModel]
    @State private var search: String = ""
    
    var searchLeaguesResults: [LeagueModel] {
        if search.isEmpty {
            return []
        } else {
            return leagues.filter { $0.name.lowercased().contains(search.lowercased()) || $0.alternativeName.lowercased().contains(search.lowercased()) }
        }
    }
    
    var searchTeamsResults: [TeamModel] {
        if search.isEmpty {
            return []
        } else {
            return teams.filter { $0.leagues.lowercased().contains(search.lowercased()) }
        }
    }
    
    // MARK: - Constructors
    
    init(modelContext: ModelContext) {
        let presenter = LeaguesListPresenter(leaguesRepository: LeaguesRepository(context: modelContext),
                                             teamsRepository: TeamsRepository(context: modelContext))
        self._presenter = State(initialValue: presenter)
    }
    
    // MARK: - SwiftUI
    
    var body: some View {
        NavigationView {
            Group {
                if leagues.isEmpty && presenter.isOnError == false {
                    loadingView
                } else if presenter.isOnError {
                    errorView
                } else {
                    teamsListView
                }
            }
        }.task {
            await presenter.getLeagues()
        }
    }
    
    /// View for displaying a loading indicator while data is being fetched.
    var loadingView: some View {
        ProgressView()
    }
    
    /// View for displaying an error message and a retry button.
    var errorView: some View {
        ErrorScreen() {
            await presenter.getLeagues()
        }
    }
    
    /// View for displaying the list of teams.
    var teamsListView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.fixed(150)), GridItem(.fixed(150))], spacing: 16) {
                ForEach(searchTeamsResults) { item in
                    NavigationLink {
                        TeamDetailView(team: item)
                    } label: {
                        TeamCell(team: item)
                            .frame(width: 150, height: 200)
                    }
                }
            }
            .padding(16)
        }
        .searchable(text: $search) {
            ForEach(searchLeaguesResults, id: \.self) { result in
                Text(result.name).searchCompletion(result.name)
                    .onSubmit(of: .search) {
                        presenter.searchTextSubject.send(result.name)
                    }
            }
        }
        .onChange(of: search) {
            if let leagueItem = searchLeaguesResults.first(where: { leagueItem in
                leagueItem.alternativeName == search || leagueItem.name == search
            }) {
                presenter.searchTextSubject.send(leagueItem.name)
            }
        }
        .onAppear {
            presenter.observeSearchChanges()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: LeagueModel.self, configurations: config)
    let modelContext = ModelContext(container)
    
    return LeaguesListView(modelContext: modelContext)
        .modelContainer(container)
}
