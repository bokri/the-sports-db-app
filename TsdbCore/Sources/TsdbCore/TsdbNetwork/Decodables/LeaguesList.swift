//
//  LeaguesList.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation


public struct LeaguesList: Codable {
    /// An array of `LeagueItem` entities representing leagues.
    public let leagues: [LeagueItem]
}
