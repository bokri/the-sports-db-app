//
//  LeaguesRepository.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import SwiftData


public struct LeaguesRepository: TsdbRepositoryProtocol {
    public typealias ModelType = LeagueModel
    
    /// The generic data access object used to interact with the local data store.
    private let dao: GenericDataAccessObject<ModelType>
    
    public init(context: ModelContext) {
        self.dao = GenericDataAccessObject(context: context)
    }
    
    internal init(dao: GenericDataAccessObject<ModelType>) {
        self.dao = dao
    }

    public func sync(_ input: [ModelType]) async {
        do {
            // Fetch existing data from the local data store
            var oldDatas = try dao.getAll()
            
            // Update local entities with new data and get new, unsaved entities
            let notAlreadySaved = updateLocalData(with: input, in: &oldDatas)
            
            // Create new items in the data store
            dao.create(notAlreadySaved)
            
            // Save changes to the local data store
            try dao.save()
        } catch {
            Logger.error("Error on synchronizing datastore with : \(error.localizedDescription)")
        }
    }
}
