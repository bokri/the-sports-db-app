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
                Text("Alternative Name: \(team.alternativeName)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Foundation Year
                Text("Foundation Year: \(team.foundationYear)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium
                Text("Stadium: \(team.stadium)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium Description
                Text("Stadium Description: \(team.stadiumDescription)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Stadium Capacity
                Text("Stadium Capacity: \(team.stadiumCapacity)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Website
                Link("Website", destination: URL(string: team.website)!)
                    .font(.subheadline)
                    .foregroundColor(.blue)

                // Social Media Links
                HStack {
                    Image(systemName: "facebook")
                    Text("Facebook: \(team.facebook)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                HStack {
                    Image(systemName: "twitter")
                    Text("Twitter: \(team.twitter)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                HStack {
                    Image(systemName: "instagram")
                    Text("Instagram: \(team.instagram)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                // Team Description
                Text("Team Description: \(team.teamDescription)")
                    .font(.body)

                Spacer()
            }
            .padding(16)
        }
        .navigationBarTitle(team.name, displayMode: .inline)
    }
}
