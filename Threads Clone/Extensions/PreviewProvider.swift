//
//  PreviewProvider.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 27/08/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Harvey Specter", email: "harvey@gmail.com", username: "harveyspecter")
    
    lazy var thread = Thread(ownerUid: "123",
                        caption: "This is a test thread",
                        timestamp: Timestamp(),
                        likes: 37,
                        replyCount: 5,
                        user: user
    )
    
    lazy var reply = ThreadReply(
        threadId: "123",
        replyText: "This a preview reply",
        threadReplyOwnerUid: "1253",
        threadOwnerUid: "988832",
        timestamp: Timestamp(),
        thread: thread,
        replyUser: user
    )
}

