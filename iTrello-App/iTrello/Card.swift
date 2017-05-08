//
//  Card.swift
//  iTrello
//
//  Created by Ramesh.Kon 11/10/16

import UIKit

class Card {
    var id: String
    var name: String
    var description: String
    
    init(id: String, name: String, desc: String) {
        self.id = id
        self.name = name
        self.description = desc
    }
}