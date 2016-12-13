//: Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["The Mechanic" : 8, "Mission Impossible series" :7,"Angry Birds" :8]
print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Dumb and Dumber"]
movieRatings["dark City"] = 5
movieRatings
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Dumb and Dumber")
if let lastRating = oldRating, currentRating = movieRatings["Dumb and Dumber"] {
    print("Old rating: \(lastRating); currentRating:\(currentRating)")
}