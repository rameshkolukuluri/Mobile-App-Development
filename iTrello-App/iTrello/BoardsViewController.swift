//
//  BoardsViewController.swift
//  iTrello
//  Created by Ramesh.K on 11/10/16.

import UIKit

class BoardsViewController: UITableViewController {
    
    var trelloAPI: TrelloAPI!
    var boards: [Board] = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trelloAPI.fetchAllBoards{
            (allBoards)->Void in
            self.boards = allBoards
            dispatch_async(dispatch_get_main_queue(), { self.tableView.reloadData() })
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boards.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BoardCell", forIndexPath: indexPath)
        let board = self.boards[indexPath.row]
        cell.textLabel?.text = board.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowBoard" {
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                let board = boards[row]
                let listsViewController = segue.destinationViewController as! ListsViewController
                listsViewController.board = board
                listsViewController.trelloAPI = self.trelloAPI
            }
        }
    }
}
