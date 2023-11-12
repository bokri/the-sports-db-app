//
//  TeamModel.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import SwiftData

@Model
public class TeamModel: Identifiable {
    
    // MARK: - Properties

    @Attribute(.unique)
    public var id: String
    public var name: String
    public var alternativeName: String
    public var foundationYear: String
    public var stadium: String
    public var stadiumDescription: String
    public var stadiumCapacity: String
    public var website: String
    public var facebook: String
    public var twitter: String
    public var instagram: String
    public var teamDescription: String
    public var country: String
    public var logo: String
    public var banner: String
    
    // MARK: - Constructors
    
    init(id: String,
         name: String,
         alternativeName: String,
         foundationYear: String,
         stadium: String,
         stadiumDescription: String,
         stadiumCapacity: String,
         website: String,
         facebook: String,
         twitter: String,
         instagram: String,
         teamDescription: String,
         country: String,
         logo: String,
         banner: String) {
        self.id = id
        self.name = name
        self.alternativeName = alternativeName
        self.foundationYear = foundationYear
        self.stadium = stadium
        self.stadiumDescription = stadiumDescription
        self.stadiumCapacity = stadiumCapacity
        self.website = website
        self.facebook = facebook
        self.twitter = twitter
        self.instagram = instagram
        self.teamDescription = teamDescription
        self.country = country
        self.logo = logo
        self.banner = banner
    }
}
