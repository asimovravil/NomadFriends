//
//  FriendInfo.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import Foundation

struct FriendInfo {
    var name: String
    var imageName: String
    var score: Int

    init(name: String, imageName: String = "friend1", score: Int = 0) {
        self.name = name
        self.imageName = imageName.isEmpty ? "friend1" : imageName
        self.score = score
    }
}

