//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func guessRandomNumber (low:Int, high : Int) -> Int {
    let range = high - (low - 1)
    return ( Int(arc4random()) % range) + (low - 1)
}

var actualNumber = guessRandomNumber(1, high: 100)

var guess = 50
if guess > actualNumber{
    print("You guess more than required");
}else if (guess < actualNumber){
    print("You guessed lower than actual")
}else{
    print("You got it absolutely correct");
}