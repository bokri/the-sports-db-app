//
//  TeamDetailView.swift
//
//
//  Created by Aymen Bokri on 14/11/2023.
//

import Foundation
import SwiftUI

public struct TeamDetailView: View {
    
    // MARK: - Properties
    
    public var team: TeamModel
    
    // MARK: - Constructors
    
    public init(team: TeamModel) {
        self.team = team
    }
    
    // MARK: - SwiftUI

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Team Logo
                CacheImageView(imageURL: team.logo, height: 150)

                // Team Name
                Text(team.name)
                    .font(.title)
                    .fontWeight(.bold)

                // Alternative Name
                Text("team.alternativeName \(team.alternativeName)", bundle: Bundle.module)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Foundation Year
                Text("team.foundationYear \(team.foundationYear)", bundle: Bundle.module)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium
                Text("team.stadium \(team.stadium)", bundle: Bundle.module)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium Description
                Text("team.stadiumDescription \(team.stadiumDescription)", bundle: Bundle.module)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium Capacity
                Text("team.stadiumCapacity \(team.stadiumCapacity)", bundle: Bundle.module)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                if let url = URL(string: team.website) {
                    // Website
                    Link(String(localized: "team.website", bundle: Bundle.module), destination: url)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }

                // Team Description
                Text("team.teamDescription \(team.teamDescription)", bundle: Bundle.module)
                    .font(.body)

                Spacer()
            }
            .padding(16)
        }
        .navigationBarTitle(team.name, displayMode: .inline)
    }
}
