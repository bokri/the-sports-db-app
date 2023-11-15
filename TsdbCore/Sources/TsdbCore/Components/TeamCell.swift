//
//  TeamCell.swift
//
//
//  Created by Aymen Bokri on 14/11/2023.
//

import Foundation
import SwiftUI

public struct TeamCell: View {
    
    // MARK: - Properties
    
    var team: TeamModel
    
    // MARK: - Constructors
    
    public init(team: TeamModel) {
        self.team = team
    }
    
    // MARK: - SwiftUI
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Add your image view for the team logo
            CacheImageView(imageURL: team.logo, width: 80, height: 80)

            Text(team.name)
                .font(.headline)
                .fontWeight(.bold)

            Text("team.country \(team.country)", bundle: Bundle.module)
                .font(.subheadline)
                .foregroundColor(.gray)

            // Add any other information you want to display about the team

            Spacer()
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
