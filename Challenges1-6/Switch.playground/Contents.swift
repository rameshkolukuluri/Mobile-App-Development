//: Playground - noun: a place where people can play

import Cocoa

var statusCode: Int = 404
var errorString : String
switch statusCode {
case 400:
    errorString = "badRequest"
case 401:
    errorString = "Unauthorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not Found"
default :
    errorString = "none"
}
print(errorString)

switch statusCode {
case 400,401,404,403 :
    errorString = "There is something wrong with the request"
    fallthrough
default:
    errorString += "Please review the request and try again"
    print(errorString)
}

var errorString1: String = "The request failed with the error"

switch statusCode{
case 100, 101:
    errorString1 += "successful but no content, 204."
case 204:
    errorString1 += "redirection"
case 300...307:
    errorString1 += "client error"
default:
    errorString1 = "Unknown"
}
print(errorString1)

var statusCode1: Int = 404
var errorString2 : String = "the request failed with the error"
switch statusCode1 {
case 100,101:
    errorString2 += "Informal"
case 204:
    errorString2 += "sucess, but no content"
case 300...307:
    errorString2 += "redirection"
case 400...417:
    errorString2 += " client error"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString2 = "\(unknownCode) is not known error"
default :
    errorString2 = "Unexpected error"
}
print(errorString2)

//naming the tuple's elements
let error = (code: statusCode, error: errorString)
error.code
error.error
let age = 25
switch age{
case 18...35:
    print("Cool demographic")
default:
    break
}
if case 18...35 = age
{
    print("cool demograhic")
}
