//: Playground - noun: a place where people can play

import Cocoa

print("The minimum Int value is \(Int.min)")
print("The maximum value of 32 bitInt value is \(Int32.max)")
print("The minimum value of 32 bitInt value is \(Int32.min)")

print("The maximum UInt value is \(UInt.max)")
print("The minimum UInt value is \(UInt.min)")
print("The maximum value of 32 bit UInt value is \(UInt32.max)")
print("The minimum value of 32 bit UInt value is \(UInt32.min)")

let numberOfPages: Int = 5
let volumeAdjustment: Int32 = -1000

//performing basic operation

print(5*5)
print(3-5)
print(7 + 2 * 5)
print(30 - (5-5))
print(11 / 3) // division
print(11%3)   //reminders

var x = 9
x++
print(x)
x--
print(x)

//bettera option for increment and decrement is

x += 1
print(x)

x -= 4
print(x)

let a: Int16 = 500
let b: Int8 = 100
//let c = a + b error because of type change
//so
let c = a + Int16(b)
print(c)


//floting point numbers

print(10.0 + 11.4)

