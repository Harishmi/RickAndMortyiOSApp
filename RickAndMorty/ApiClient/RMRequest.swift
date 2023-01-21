//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Harish Thirunalveli on 18/01/23.
//

import Foundation

/// Object that represent single API Call
final class RMRequest {

    private struct constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    
    let endPoint: RMEndpoint
    let pathComponents: Set<String>
    let queryParameters: [URLQueryItem]

    private var urlString: String {
        var string = constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap( {
                guard let value = $0.value else { return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    public var url: URL? {
        return URL(string: urlString)
    }

    public var httpMethod: String = "GET"
    
    /// Construct Request
    /// - Parameters:
    ///   - endPoint: Target Endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters:  Collection of Query parameters
    public init(endPoint: RMEndpoint, pathComponents:Set<String> = [],
                queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
