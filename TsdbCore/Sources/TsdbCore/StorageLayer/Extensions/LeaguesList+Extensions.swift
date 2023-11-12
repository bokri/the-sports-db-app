//
//  LeaguesList+Extensions.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

public extension LeaguesList {
    /**
     An extension for converting decoded JSON `LeaguesList` to `LeagueModel` objects.
     
     - Returns: An array of `LeagueModel` objects or an empty array.
     */
    func toData() -> [LeagueModel] {
        return leagues.map { item in
            item.toData()
        }
    }
}
