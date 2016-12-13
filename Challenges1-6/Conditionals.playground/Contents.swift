//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 5422
var mesage: String
var hasPostOffice: Bool = true
if population < 10000
{
    mesage = "\(population) is a small town!"
}
else
    {
        if population >= 10000 && population < 50000
        {
            mesage = "\(population) is  a medium town!"
        }
        else
        {
            mesage = "\(population) is pretty big!"
        }
}
print(mesage)

if !hasPostOffice
{
    print("Where do we buy stamps?")
}
        




