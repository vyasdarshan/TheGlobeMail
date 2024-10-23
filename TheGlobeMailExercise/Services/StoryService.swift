//
//  StoryService.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import Foundation
import Combine

protocol APIService{
    func fetchStories () -> AnyPublisher <[Story], Error>
}


class StoryService: APIService {
    func fetchStories() -> AnyPublisher<[Story], Error> {
        //TODO: add try catch here
        guard let url = URL(string: API.Endpoints.recommendations) else {
                    return Fail(error: StoryServiceError.unknownError("Invalid URL")).eraseToAnyPublisher()
                }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RecommendationsResponse.self, decoder: JSONDecoder())
            .map { $0.recommendations}
            .mapError ( handleError)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func handleError(_ error: Error) -> StoryServiceError {
            if let urlError = error as? URLError {
                return .networkError(urlError)
            } else if let decodingError = error as? DecodingError {
                return .decodingError(decodingError)
            } else {
                return .unknownError(Strings.loadingError)
            }
        }
}
