//
//  ContentActionButtonsViewModel.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 29/08/23.
//

import Foundation

@MainActor
class ContentActionButtonsViewModel: ObservableObject {
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfUserLikedThread() }
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws {
        let didlike = try await ThreadService.checkIfUserLikedThread(thread)
        
        // only execute update if thread has been liked
        if didlike {
            self.thread.didLike = true
        }
    }
}
