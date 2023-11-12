//
//  LeagueModel.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import SwiftData

@Model
public class LeagueModel: Identifiable {
    
    // MARK: - Properties

    @Attribute(.unique)
    public var id: String
    public var name: String
    public var sport: String
    public var alternativeName: String
    
    // MARK: - Constructors
    
    public init(id: String,
                name: String,
                sport: String,
                alternativeName: String) {
        self.id = id
        self.name = name
        self.sport = sport
        self.alternativeName = alternativeName
    }
}
