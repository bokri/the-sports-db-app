//
//  TeamItem.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

public struct TeamItem: Codable {
    public let idTeam: String
    public let strTeam: String
    public let strAlternate: String?
    public let intFormedYear: String
    public let strStadium: String?
    public let strStadiumDescription: String?
    public let intStadiumCapacity: String?
    public let strWebsite: String?
    public let strFacebook: String?
    public let strTwitter: String?
    public let strInstagram: String?
    public let strDescriptionEN: String?
    public let strCountry: String
    public let strTeamBadge: String?
    public let strTeamBanner: String?
    public let strLeague: String
    public let strLeague2: String?
    public let strLeague3: String?
    public let strLeague4: String?
    public let strLeague5: String?
    public let strLeague6: String?
    public let strLeague7: String?
}
