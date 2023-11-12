//
//  TheSportsDbAPIEndpoint.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation

/**
 **
  An enumeration that represents various API endpoints for The Sports Database.

  The `TheSportsDbAPIEndpoint` enumeration defines a set of API endpoints used to access different features and data related to leagues and teams on TSDb. Each case of this enumeration corresponds to a specific endpoint and provides details such as the URL, HTTP method, parameters, request body, and headers required for making network requests.

  - Note: This enumeration is used to construct and define the details of network requests for fetching sports-related data from TSDb. It includes endpoints for retrieving leagues and teams..

 */
public enum TheSportsDbAPIEndpoint: APIEndpoint {
    /// The base URL for TSDb API requests.
    private static let baseURL = "https://www.thesportsdb.com/api/v1/json/3"
    
    /// Represents an endpoint for fetching all leagues.
    case allLeagues
    /// Represents an endpoint for all teams for a specific league.
    case allTeams(league: String)
    
    /// The path specific to each API endpoint.
    private var path: String {
        return switch self {
        case .allLeagues:
            "/all_leagues.php"
        case .allTeams:
            "/search_all_teams.php"
        }
    }
    
    /// A dictionary of parameters to be included in the request.
    public var parameters: [String : Any] {
        var parameters: [String: Any] = [:]
        
        switch self {
        case .allLeagues:
            break
        case .allTeams(let league):
            parameters["l"] = league
        }
        return parameters
    }
    
    /// The HTTP method for this endpoint (e.g., GET, POST, PUT, etc.).
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    /// The complete URL for this endpoint, constructed from the base URL and endpoint-specific path.
    public var url: String {
        return TheSportsDbAPIEndpoint.baseURL + self.path
    }
    
    /// The request body (if any) for this endpoint. Returns nil for GET requests.
    public var requestBody: Data? {
        return nil
    }
    
    /// The request headers (if any) for this endpoint. Returns nil for no specific headers.
    public var headers: [String : String]? {
        return nil
    }
}
