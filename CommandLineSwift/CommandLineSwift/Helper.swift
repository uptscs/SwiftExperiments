//
//  Helper.swift
//  CommandLineSwift
//
//  Created by Upendra Tripathi on 2/11/16.
//  Copyright © 2016 Oracle Inc. All rights reserved.
//

import Foundation

func guessRandomNumber (low:Int, high : Int) -> Int {
    let range = high - (low - 1)
    return ( Int(arc4random()) % range) + (low - 1)
}

class Person {
    var firstName = ""
    var lastName = ""
    var age = 0
    init(){
    
    }
    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        if let string = rawString {
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else {
            return "Invalid input"
        }
    }
    func changeFirstName(newFirstName: String){
        firstName = newFirstName
    }
    
    func enterUserInfo(){
    print("Please enter first name:")
        firstName = input()
        print("Please enter last name:")
        lastName = input()
        print("Please enter age")
        let userInputString = input()
        let userInput = Int(userInputString)
        if let number = userInput{
            age = number
        }
    }
    func printUserInfo(){
        print("Welcome \(firstName) \(lastName) of age: \(age)")
    }
    
    
}