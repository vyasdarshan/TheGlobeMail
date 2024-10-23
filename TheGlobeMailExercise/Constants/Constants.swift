//
//  Constants.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import Foundation

struct API {
    static let baseURL = "https://d2c9087llvttmg.cloudfront.net/"
    
    struct Endpoints {
        static let recommendations = "\(baseURL)trending_and_sophi/recommendations.json"
    }
}

struct Strings {
    
    static let loadingTitle = "Loading..."
    static let loadingError = "An error occurred while loading."
    static let errorTitle = "Error"
    static let errorFailedToLoad = "Failed to load stories"
    
    static let genericErrorMessage = "An unknown error occurred."
    
    
    static let storiesNavigationTitle = "Stories"
    
    
    static let retryActionTitle = "Retry"
    
}
