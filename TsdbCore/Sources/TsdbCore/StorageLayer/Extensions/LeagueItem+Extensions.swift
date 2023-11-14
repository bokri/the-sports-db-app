//
//  LeagueItem+Extensions.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

public extension LeagueItem {
    /**
     Converts a `LeagueItem` instance to a `LeagueModel`.
     
     This method takes an instance of `LeagueItem` and transforms it into a  `LeagueModel`. It maps properties from the `LeagueItem` to the `LeagueModel`.
     
     - Returns: A detailed `LeagueModel` instance with enhanced movie information.
     */
    func toData() -> LeagueModel {
        return LeagueModel(id: idLeague,
                           name: strLeague,
                           sport: strSport,
                           alternativeName: strLeagueAlternate ?? "")
    }
}
