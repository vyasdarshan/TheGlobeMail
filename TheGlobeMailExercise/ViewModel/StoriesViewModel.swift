//
//  StoriesViewModel.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import Foundation
import Combine

class StoriesViewModel : ObservableObject {
    
    @Published var stories : [Story] = []
    @Published var errorMessage : String?
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let storyService : APIService
    
    init(storyService : APIService = StoryService()) {
        self.storyService = storyService
    }
    
    func fetchStories () {
        isLoading = true
        storyService.fetchStories()
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished :
                    break
                case .failure(let error):
                    self.errorMessage = "\(Strings.errorFailedToLoad): \(error.localizedDescription)"
                                    
                }
                
            }) {[weak self ]  stories in
                self?.stories = stories
            }
            .store(in: &cancellables)
    }
    
}
