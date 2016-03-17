//
//  main.swift
//  CommandLineSwift
//
//  Created by Upendra Tripathi on 2/11/16.
//  Copyright © 2016 Oracle Inc. All rights reserved.
//

import Foundation

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

//while(true){
//    var actualNumber = guessRandomNumber(1, high: 100)
//    print("Enter a number between 1 and 100.")
//    let userInputString = input()
//    let userInput = Int(userInputString)
//   
//    if let guess = userInput {
//        if guess > actualNumber {
//            print("Lower");
//        }else if guess < actualNumber {
//            print("Highr")
//        }else{
//            print("Correct");
//        }
//        break;
//    }else {
//        print("This is not working, bhai!!!")
//        continue;
//    }
//
//}
var response : String
var people:[Person] = []

repeat{
    var newPerson = Person()
    newPerson.enterUserInfo()
    people.append(newPerson)
    print("Do you wish to continue? y for yes n for no")
    response = input()
}while(response == "y")

for individual in people{
    individual.printUserInfo()
}