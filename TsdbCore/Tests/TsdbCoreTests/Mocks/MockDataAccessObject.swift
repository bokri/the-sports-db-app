//
//  MockDataAccessObject.swift
//
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
@testable import TsdbCore
import SwiftData

class MockDataAccessObject<Model: PersistentModel>: GenericDataAccessObject<Model> {
    
    var getAllReturnValue: [Model] = []
    var createCalled = false
    var saveCalled = false

    override func getAll() throws -> [Model] {
        return getAllReturnValue
    }
    
    override func create(_ models: [Model]) {
        createCalled = true
    }
    
    override func save() throws {
        saveCalled = true
    }
}
