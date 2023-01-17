//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Harish Thirunalveli on 18/01/23.
//

import Foundation

/// Represents unique API request
@frozen enum RMEndpoint: String {
    case character // "character"
    case location
    case episode
}
