//
//  StoryServiceError.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import Foundation

enum StoryServiceError: Error {
    case networkError(Error)
    case decodingError(Error)
    case unknownError(String)
    
    var localizedDescription: String {
        switch self {
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknownError(let message):
            return message
        }
    }
}

