//
//  Comment.swift
//  MVP
//
//  Created by MacBookPro on 19.01.2022.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
