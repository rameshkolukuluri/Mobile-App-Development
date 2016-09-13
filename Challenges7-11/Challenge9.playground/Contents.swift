//: Playground - noun: a place where people can play

import Cocoa

var bucketList = ["Climb Mt. Everest"]
var newItems = [
"Fly hot air ballon to Fiji",
"Watch the Lord of the Rings teiology in one day",
"Go on a walkout",
"Scuba dive in the Great Blue Hole",
"Find a triple rainbow",
]
bucketList += newItems
bucketList
bucketList.removeAtIndex(2)
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " in Australia "
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", atIndex: 2)
bucketList

var myronsList = [
                    "Climb Mt. Everest",
                    "Fly hot air ballon to Fiji",
                    "Watch the Lord of the Rings teiology in one day",
                    "Go on a walkout",
                    "Scuba dive in the Great Blue Hole",
                    "Find a triple rainbow",
                    
    
]
let equal = (bucketList == myronsList)