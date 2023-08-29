//
//  Thread.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 28/08/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable, Hashable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var replyCount: Int
    
    var didLike: Bool? = false
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
