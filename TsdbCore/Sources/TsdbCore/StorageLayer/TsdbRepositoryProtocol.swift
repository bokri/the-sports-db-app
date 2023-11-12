//
//  TsdbRepositoryProtocol.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation


public protocol TsdbRepositoryProtocol {
    associatedtype ModelType
    
    func sync(_ input: [ModelType]) async
    
    func updateLocalData(with input: [ModelType], in localDatas: inout [ModelType]) -> [ModelType]
}

// MARK: - Default Implementation

public extension TsdbRepositoryProtocol where ModelType: Identifiable {
    func updateLocalData(with input: [ModelType], in localDatas: inout [ModelType]) -> [ModelType] {
        // Update oldDatas with new values based on matching IDs
        for (index, oldData) in localDatas.enumerated() {
            if let matchingNewData = input.first(where: { $0.id == oldData.id }) {
                localDatas[index] = matchingNewData
            }
        }
        
        // Find new items (notAlreadySaved) that are not present in oldDatas
        let notAlreadySaved = input.filter { newData in
            !localDatas.contains { $0.id == newData.id }
        }
        
        return notAlreadySaved
    }
}
