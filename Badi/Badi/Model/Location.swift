//
//  Post.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

struct Location: Codable {
    var id: Int
    var name: String
    var type: String
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.name = (try container.decode(String.self, forKey: .tag)).uppercaseFirst
//        self.tag = (try container.decode(String.self, forKey: .tag)).uppercaseFirst
//    }
}
