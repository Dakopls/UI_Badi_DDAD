//
//  StringUtils.swift
//  Christmapps
//
//  Created by user on 13/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import Foundation

extension StringProtocol {
    var uppercaseFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
}
