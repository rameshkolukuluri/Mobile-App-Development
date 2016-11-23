//
//  List.swift
//  iTrello
//
//  Created by Ramesh.K on 11/10/16.

import UIKit

class List {
    var id: String
    var name: String
    var cards: [Card]
    
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
        self.cards = [Card]()
    }
}