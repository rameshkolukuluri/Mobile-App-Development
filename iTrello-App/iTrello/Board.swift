//
//  Board.swift
//  iTrello
//
//  Created by Ramesh.K on 11/10/16.

import UIKit

class Board {
    var id: String
    var name: String
    var lists: [List]
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
        self.lists = [List]()
    }
}