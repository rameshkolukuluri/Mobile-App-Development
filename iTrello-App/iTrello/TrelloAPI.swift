//
//  TrelloAPI.swift
//  iTrello
//
//  Created by Ramesh Kolukuluri on 11/14/16.
//  Copyright © 2016 Ramesh.K. All rights reserved.
//

import Foundation
enum Method: String {
    case boards
    case lists
    case cards
    case members
}

enum BoardsResult {
    case Success
    case Failure
}

class TrelloAPI {
    
    private let baseURLString = "https://api.trello.com/1"
    private let APIKey = "73c2e2e48248e53ebad07880227c612b"
    private let authKey = "2204da9f5adfa22bdc49c4cab107c8b0e3a93c754559c0ca39189811a8f3599e"
    
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    func fetchAllBoards(completion completion: ([Board]) -> Void) {
        let url = NSURL(string: "\(baseURLString)/members/ramesh_iynar/boards?key=\(APIKey)&token=\(authKey)")!
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            if let boards = self.processAllBoardsRequest(data: data, error: error) {
                completion(boards)
            }
        }
        task.resume()
    }
    
    func processAllBoardsRequest(data data: NSData?, error: NSError?) -> [Board]? {
        guard let jsonData = data else {
            return nil
        }
        do {
            let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            
            guard let
                jsonDictionary = jsonObject as? [[NSObject:AnyObject]]
                else {
                    return nil
            }
            
            var boards = [Board]()
            for boardDictionary in jsonDictionary {
                boards.append(Board(id: (boardDictionary["id"] as? String)!, name: (boardDictionary["name"] as? String)!))
            }
            return boards
        }
        catch let error {
            print(error)
            return nil
        }
        
    }
    
    func fetchListsForBoard(board board: Board, completion: ([List]) -> Void) {
        let boardID = board.id
        let url = NSURL(string: "\(baseURLString)/boards/\(boardID)/lists?key=\(APIKey)&token=\(authKey)")!
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            if let lists = self.processAllListsRequest(data: data, error: error) {
                completion(lists)
            }
        }
        task.resume()
    }
    
    func processAllListsRequest(data data: NSData?, error: NSError?) -> [List]? {
        guard let jsonData = data else {
            return nil
        }
        do {
            let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            
            guard let
                jsonDictionary = jsonObject as? [[NSObject:AnyObject]]
                else {
                    return nil
            }
            
            var lists = [List]()
            for listDictionary in jsonDictionary {
                lists.append(List(id: (listDictionary["id"] as? String)!, name: (listDictionary["name"] as? String)!))
            }
            return lists
        }
        catch let error {
            print(error)
            return nil
        }
    }
    
    func fetchCardsForList(list list: List, completion: ([Card]) -> Void) {
        let listID = list.id
        let url = NSURL(string: "\(baseURLString)/lists/\(listID)/cards?key=\(APIKey)&token=\(authKey)")!
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            if let cards = self.processAllCardsRequest(data: data, error: error) {
                completion(cards)
            }
        }
        task.resume()
    }
    
    func processAllCardsRequest(data data: NSData?, error: NSError?) -> [Card]? {
        guard let jsonData = data else {
            return nil
        }
        do {
            let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            
            guard let
                jsonDictionary = jsonObject as? [[NSObject:AnyObject]]
                else {
                    return nil
            }
            
            var cards = [Card]()
            for cardDictionary in jsonDictionary {
                cards.append(Card(id: (cardDictionary["id"] as? String)!, name: (cardDictionary["name"] as? String)!, desc: (cardDictionary["desc"] as? String)!))
            }
            return cards
        }
        catch let error {
            print(error)
            return nil
        }
        
    }
    
    func addCard(name: String, description: String, listID: String, completion: (Card) -> Void) {
        if let newName = name.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()),
            newDesc = description.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            let url = NSURL(string: "\(baseURLString)/cards?name=\(newName)&desc=\(newDesc)&idList=\(listID)&key=\(APIKey)&token=\(authKey)")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            let task = session.dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                
                if let card = self.processAddCardRequest(data: data, error: error) {
                    completion(card)
                }
            }
            task.resume()
        }
    }
    
    func processAddCardRequest(data data: NSData?, error: NSError?) -> Card? {
        guard let jsonData = data else {
            return nil
        }
        do {
            let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            
            guard let
                jsonDictionary = jsonObject as? [NSObject:AnyObject]
                else {
                    return nil
            }
            
            let card = Card(id: (jsonDictionary["id"] as? String)!, name: (jsonDictionary["name"] as? String)!, desc: (jsonDictionary["desc"] as? String)!)
            return card
        }
        catch let error {
            print(error)
            return nil
        }
    }
    
    func updateCard(cardID: String, name: String, description: String, completion: (Card) -> Void) {
        if let newName = name.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()),
            newDesc = description.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            let url = NSURL(string: "\(baseURLString)/cards/\(cardID)?name=\(newName)&desc=\(newDesc)&key=\(APIKey)&token=\(authKey)")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "PUT"
            let task = session.dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                
                if let card = self.processAddCardRequest(data: data, error: error) {
                    completion(card)
                }
            }
            task.resume()
        }
    }
    
    func processUpdateCardRequest(data data: NSData?, error: NSError?) -> Card? {
        guard let jsonData = data else {
            return nil
        }
        do {
            let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            
            guard let
                jsonDictionary = jsonObject as? [NSObject:AnyObject]
                else {
                    return nil
            }
            
            let card = Card(id: (jsonDictionary["id"] as? String)!, name: (jsonDictionary["name"] as? String)!, desc: (jsonDictionary["desc"] as? String)!)
            return card
        }
        catch let error {
            print(error)
            return nil
        }
    }
    
    func deleteCard(card card: Card) {
        let cardID = card.id
        let url = NSURL(string: "\(baseURLString)/cards/\(cardID)?key=\(APIKey)&token=\(authKey)")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "DELETE"
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            guard data != nil else {
                print("Error: did not receive data")
                return
            }
        }
        task.resume()
    }
    
    
}
