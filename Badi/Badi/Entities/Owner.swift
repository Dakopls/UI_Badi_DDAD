//
//  Owner.swift
//  Badi
//
//  Created by user on 02/02/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

struct Owner: Codable {
    
    var name: String
    var age: Int
    var gender: String
    var display: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.display = name.getFirstWord.uppercaseFirst + ", " + String(age)
    }
}
