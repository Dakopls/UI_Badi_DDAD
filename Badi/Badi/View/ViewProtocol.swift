//
//  ViewProtocol.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit

protocol ViewProtocol {
    
    func populate<T> (content: T)
    
}


protocol CellUtilsDelegate: class {
    
    func cellDidSelect<T>(_ cell: UITableViewCell, with content: T) -> Void
    
}

