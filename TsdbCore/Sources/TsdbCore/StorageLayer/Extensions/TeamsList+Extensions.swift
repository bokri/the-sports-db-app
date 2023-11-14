//
//  TeamsList+Extensions.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

public extension TeamsList {
    /**
     An extension for converting decoded JSON `TeamsList` to `TeamModel` objects.
     
     - Returns: An array of `TeamModel` objects or an empty array.
     */
    func toData() -> [TeamModel] {
        return teams?.map { item in
            item.toData()
        } ?? []
    }
}
