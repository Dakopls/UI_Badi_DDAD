//
//  Room.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

struct Room: Codable {
    
    var id: Int
    var title: String
    var price: Double
    var kind: String
    var photos: Array<Photo>
    var user: User
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.title = (try container.decode(String.self, forKey: .title)).uppercaseFirst
//        self.price = try container.decode(Float.self, forKey: .price)
//        self.city = (try container.decode(String.self, forKey: .city)).uppercaseFirst
//        self.photos = try container.decode(Array<Photo>.self, forKey: .photos)
//        self.user = try container.decode(User.self, forKey: .user)
//    }
    
}
