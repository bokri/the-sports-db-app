//
//  LeagueItem.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation


public struct LeagueItem: Codable {
    let idLeague: String
    let strLeague: String
    let strSport: String
    let strLeagueAlternate: String?
}
