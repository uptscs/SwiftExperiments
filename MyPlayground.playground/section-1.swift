// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let iOSTeamMembers = 800.0
let androidTeamMembers = 200.0
var mobilePracticeStrength: Double = iOSTeamMembers + androidTeamMembers
mobilePracticeStrength += 1

println("Total mobile team members are: \(mobilePracticeStrength)")
println("Total mobile team members are: \(iOSTeamMembers + androidTeamMembers)")

//String Operations
let labelText = "The value of label is: "
let labelValue = 98
let widthLabel = labelText + String(labelValue);
println(widthLabel)


//Looping

let individualScore = [10, 12, 13, 14, 20, 25, 28, 30, 40, 53, 64, 23]
var teamScore = 0
for score in individualScore{
    if score > 20{
        teamScore += 2
    }
    else{
        teamScore += 1
    }
}
teamScore


var loopCount = 0
for i in 0..<4{
    loopCount++
}
loopCount
//Optional
var optionalString : String? = "Ram"
optionalString = nil

var optionalName : String? = "Ram"
var greeting = "Hello!"
//optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "Hello guest"
}
greeting

//Most improved switch statement

let vegetable = "Bringlepepper"

switch vegetable{
    case "Lauki":
        let vegetableComment = "Lauki is not tasty"
    case "Capsicum", "Potato":
        let vegetableComment = "Keep it up, Capsicum, Potato does good for any North Indian"
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Spicy food: \(x)"
    default:
        let vegetableComment = "Soup is good with any ingredients"
}



//Array Dictionary framework
var students = ["Ram", "Rahim", "Test 1", "Test2"]
println(students[1])

let occupations = [
    "Ram" : "God",
    "Rahim": "Priest",
    "Test 1" : "Test 1",
    "Test2" : "Test2"
]

let ramOccupation = occupations["Ram"]
println("Occupation of Ram: \(ramOccupation)")
if(ramOccupation == "God"){
    println("Ram is God")
}

//Empty array or empty dictionary
let emptyArray = []
let emptyDictionary = [:]


var listofKindandNumbers = [
    "Prime": [1,3,5,7,11,13,],
    "Even": [2,4,6,8,10],
    "Fibonacci":[1,1,2,3,5,8,13,21],
    "Square":[1, 4, 9, 16, 25]
]
for (kind, numbers) in listofKindandNumbers{
    for number in numbers{
        println("\(kind) : \(number)")
    }
}


/****************************Functions****************************/

func greet(name:String, day:String) ->String {
    return "Hello \(name) Today is \(day)"
}
greet("Upendra", "Friday")

func scoreEvaluation(scores : [Int]) -> (min:Int , max:Int, sum:Int) {
    var sum = 0
    var min = scores[0]
    var max = scores[0]
    for score in scores{
        if score < min{
            min = score
        }
        if score > max {
            max = score
        }
        sum += score;
    }
    return(min, max, sum)
}
let statics = scoreEvaluation([40, 50, 30, 24, 26, 56, 78, 53])
statics.min
statics.max
statics.sum

//Function with variable number of elements
func sum(numbers:Int...) -> Int {
    var total = 0
    for number in numbers{
        total += number
    }
    return total
}
sum(10, 20, 30)

//Function returns functions
func makeIncreament() -> (Int -> Int) {
    func addOne (number:Int) -> Int {
        return number+1;
    }
    return addOne;
}
var increament = makeIncreament()
increament(7)

//Function used as argument

func hasAnymatch (list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true;
        }
    }
    return false;
}

func lessThanTen (number : Int) -> Bool {
    return number < 10
}
let list = [10,14,1,5,4,5,6,6,7,3,4345,6,7,657,56,7567]
let item = 10;
hasAnymatch(list, lessThanTen)

//Function closure
func testClosure( numbers: [Int]) {
    //Closure with memeber with it's type declared (number)
//    numbers.map({
//        (number: Int) -> Int in
//        let result = number * 3
//        return result;
//    })

    //Closure and it's with type declared (number)
    let result = numbers.map({number in number * 3})
    result
}
let items = [10, 10, 20, 30]
testClosure(items)
//Refering to parameter with seuence number instead of name
var sortedNumbers = sorted(items){ $0 < $1}
sortedNumbers


/******************************    Objects and Classess    *********************************/

class NamedShape {
    var numberofLines = 0
    let minimumNumberofLines = 0;
    var name: String
    
    init(name: String) {
        self.name = name;
    }
    func simpleDescription() -> String {
        return "\(name) has \(numberofLines) lines"
    }
    
    func getMinimumNumberofLines()->Int {
        return minimumNumberofLines
    }
}
var name = "Square"
var shape = NamedShape(name: name);
shape.numberofLines = 4;
shape.simpleDescription();

//Inheritance, with override keyword
class Square: NamedShape {
    var sideLength : Double
    
    init(sideLength : Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name)
        numberofLines = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {
        return "A square with the side of length: \(sideLength)"
    }
}

let square = Square(sideLength: 10, name: "Square")
square.area()
square.simpleDescription()

//Properties with getter and setter methods

class EquilateralTriangle: NamedShape {
    var sideLength : Double
    
    init(sideLength : Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name)
        numberofLines = 4;
    }

    var perimeter : Double {
        get {
            return 3.0 * sideLength;
        }
        set {
            sideLength = newValue / 3.0;
        }
    }
    func area() -> Double {
        return sideLength * sideLength;
    }

    override func simpleDescription() -> String {
        return "A square with the side of length: \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "A Triangle")
triangle.perimeter
triangle.perimeter = 3.0
triangle.perimeter

//WillSet and DidSet experiment

class TriangleandSquare {
    var triangle : EquilateralTriangle
        {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square : Square
        {
        willSet {
            triangle.sideLength = newValue.sideLength;
        }
    }
    init (size: Double, name: String) {
        self.triangle = EquilateralTriangle(sideLength: size, name: name)
        self.square = Square(sideLength: size, name: name)
    }
}
var triangleTestShape = TriangleandSquare(size: 10.0, name: "A Test Shape")
triangleTestShape.square.sideLength
triangleTestShape.triangle.sideLength
triangleTestShape.square = Square(sideLength: 12.0, name: "Square")
triangleTestShape.triangle.sideLength

//Optional values

let optionalSquare: Square? = Square(sideLength: 10, name: "Optional test square")
let sideLength = optionalSquare?.sideLength;

//Enum
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Fifth, Sixth, Seventh, Eightth, Nineth, Thenths
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
ace.simpleDescription()
let rawAce = ace.rawValue
let two = Rank.Two
two.simpleDescription()

let convertEnumValue = Rank(rawValue: 1);
convertEnumValue?.simpleDescription()

enum Suites{
    case Hearts, Spades, Diamonds, Clubs
    func fullDescription() -> String {
        switch self {
        case .Hearts:
            return "Hearts"
        case .Spades:
            return "Spades"
        case .Diamonds:
            return "Diamonds"
        case .Clubs:
            return "Clubs"
        }
        //Following gives the eorror, as type of the enum not provided
//        String(self.rawValue)
    }
}
let hearts = Suites.Hearts;
hearts.fullDescription()

/******************************    Protocol    *********************************/

protocol ExampleProtocol {
    var simpleDescription : String {get}
    mutating func adjust()
}

class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "A simple description"
    var anotherVariable = 123123
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

var testSimpleClass = SimpleClass()
testSimpleClass.simpleDescription
testSimpleClass.adjust();
testSimpleClass.simpleDescription

struct SimpleStruc : ExampleProtocol {
    var simpleDescription: String = "TEst"
     mutating func adjust() {
        simpleDescription += " Adjusted";
    }
}

var testStruct = SimpleStruc()
testStruct.adjust()
testStruct.simpleDescription

/******************************    Extension Development    *********************************/

extension Int : ExampleProtocol {
    var simpleDescription: String {
        return "The number is \(self)"
    }
    mutating func adjust() {
        self += 10
    }
}
7.simpleDescription
var myNum = 8
myNum.adjust()
myNum

let protocolValue: ExampleProtocol = 7
protocolValue.simpleDescription

//Simple extension of Int
extension Int {
    mutating func addTen() {
        self += 10;
    }
}
myNum.addTen()



/******************************    Generics    *********************************/

//Generic functions
func repeat<Item>(item: Item, times: Int){
    var result = [Item]()
    for i in 0..<times {
        result.append(item)
    }
    result
}
repeat("Test", 5)
repeat(100000, 10)

//Generic Enums
enum OptionalValue<T>{
    case None
    case Some(T)
}
var possibleInteger : OptionalValue<Int> = .None
possibleInteger = .Some(100)

//Generic with where clause
func ​anyCommonElements​ <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false;
}
let isElementCommon = ​anyCommonElements​([1,2,3], [4])




































