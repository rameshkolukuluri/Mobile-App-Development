//: Playground - noun: a place where people can play

import Cocoa
//Declaring an optional type
var errorCodeString: String?
errorCodeString

//Logging the value of the optional to the console
errorCodeString = "404"
print(errorCodeString)

//Logging the nil value of the optional to the console
// errorCodeString = "404"
print( errorCodeString)


//Adding a condition
// errorCodeString = "404"
print(errorCodeString)
if errorCodeString ! = nil
{
    let theError = errorCodeString!
    print(theError)
}


//optional binding
if let temporaryConstant = anOptional {
    // Do something with temporaryConstant
} else {
    // There was no value in anOptional; i. e. , anOptional is nil
}

//Nesting optional binding
var errorCodeString: String?
errorCodeString = "404"
if let theError = errorCodeString {
    
    if let errorCodeInteger = Int(theError) {
        print("\(theError) : \(errorCodeInteger) ")
    }
}

//Unwrapping multiple optionals
import Cocoa
var errorCodeString: String?
errorCodeString = "404"
if let theError = errorCodeString, errorCodeInteger = Int(theError) {
    //if let errorCodeInteger = Int(theError) {
    print( "\( theError) : \( errorCodeInteger) ")
}
}


//Optional binding and where clauses
var errorCodeString: String?
errorCodeString = "404"
if let theError = errorCodeString, errorCodeInteger = Int( theError)
    where errorCodeInteger == 404 {
    print( "\( theError) : \( errorCodeInteger) ")
}


//Implicitly Unwrapped Optionals
var errorCodeString: String!
errorCodeString = "404"
print( errorCodeString)


//Optional chaining
var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?
if let theError = errorCodeString, errorCodeInteger = Int( theError)
    where errorCodeInteger == 404 {
    errorDescription = ("\(errorCodeInteger + 200) :
        the requested resource was not found. ")
}
var upCaseErrorDescription = errorDescription?. uppercaseString
errorDescription


//Modifying in place
upCaseErrorDescription?. appendContentsOf(" PLEASE TRY AGAIN. ")
upCaseErrorDescription

//Using optional binding to parse errorCodeString
let description: String
if let errorDescription = errorDescription {
    description = errorDescription
} else {
    description = "No error"
}

//Changing errorCodeString

errorDescription = nil
let description = errorDescription ?? "No error"
