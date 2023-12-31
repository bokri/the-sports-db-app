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
                HStack(alignment: .center) {
                    Spacer()
                    // Team Logo
                    CacheImageView(imageURL: team.logo, width: 200, height: 150)
                    
                    Spacer()
                }

                // Team Name
                Text(team.name)
                    .font(.title)
                    .fontWeight(.bold)

                // Alternative Name
                Text(String(localized: "team.alternativeName \(team.alternativeName)", bundle: Bundle.module))
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Foundation Year
                Text(String(localized: "team.foundationYear \(team.foundationYear)", bundle: Bundle.module))
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium
                Text(String(localized: "team.stadium \(team.stadium)", bundle: Bundle.module))
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium Description
                Text(String(localized: "team.stadiumDescription \(team.stadiumDescription)", bundle: Bundle.module))
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium Capacity
                Text(String(localized: "team.stadiumCapacity \(team.stadiumCapacity)", bundle: Bundle.module))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                if let url = URL(string: "https://\(team.website)") {
                    // Website
                    Link(String(localized: "team.website", bundle: Bundle.module), destination: url)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }

                // Team Description
                Text(String(localized: "team.teamDescription \(team.teamDescription)", bundle: Bundle.module))
                    .font(.body)

                Spacer()
            }
            .padding(16)
        }
        .navigationBarTitle(team.name, displayMode: .inline)
    }
}
