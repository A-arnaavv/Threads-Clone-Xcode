//
//  User.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 27/08/23.
//

import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
