//
//  TeamItem+Extensions.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

public extension TeamItem {
    /**
     Converts a `TeamItem` instance to a `TeamModel`.
     
     This method takes an instance of `TeamItem` and transforms it into a  `TeamModel`. It maps properties from the `TeamItem` to the `TeamModel`.
     
     - Returns: A detailed `TeamModel` instance with enhanced movie information.
     */
    func toData() -> TeamModel {
        return TeamModel(id: idTeam,
                         name: strTeam,
                         alternativeName: strAlternate ?? "",
                         foundationYear: intFormedYear,
                         stadium: strStadium ?? "",
                         stadiumDescription: strStadiumDescription ?? "",
                         stadiumCapacity: intStadiumCapacity ?? "",
                         website: strWebsite ?? "",
                         facebook: strFacebook ?? "",
                         twitter: strTwitter ?? "",
                         instagram: strInstagram ?? "",
                         teamDescription: strDescriptionEN ?? "",
                         country: strCountry,
                         logo: strTeamBadge ?? "",
                         banner: strTeamBanner ?? "",
                         leagues: "\(strLeague) - \(strLeague2) - \(strLeague3) - \(strLeague4) - \(strLeague5) - \(strLeague6) - \(strLeague7)")
    }
}
