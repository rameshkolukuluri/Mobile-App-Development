//: Playground - noun: a place where people can play

import Cocoa

//var groceryBag = Set<String>()
//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pinepales")
var groceryBag: Set = ["Apples", "Oranges", "Pinepales"]
for food in groceryBag
{
    print(food)
}
let hasBananas = groceryBag.contains("Bananas")
let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk","Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)
let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersect(roommatesGroceryBag)

let yourSecondBag = Set(["berries", "Yougurt"])
let roommateSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjointWith(roommateSecondBag)