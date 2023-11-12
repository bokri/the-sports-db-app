//
//  NetworkManagerProtocol.swift
//
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

public protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(_ endpoint: APIEndpoint, type: T.Type) async throws -> T
}
