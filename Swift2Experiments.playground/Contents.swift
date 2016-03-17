//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var name : String?
name = "Upendra"
print(str)
let constant : Double = 120.12
let result = "Welcome our guest \(str) + \(name)"


let integerNumber = [
    "Natural": [1,52,3,4,5,6,7],
    "Prime": [2,3,5,7,11,13],
    "Fibbonacci": [1,1,2,3,5,8,12],
    "Square": [4,9,16,25,36],
    //    "Names": ["Upendra", "Preeti", "Sheetal"],
]

var largest = 0;
for(kind, numbers) in integerNumber{
    for number in numbers{
        if largest < number {
            largest = number
        }
    }
}

print(largest)


//MARK: @noescape experimentation

func doItMore(@noescape code: () -> ()) {}

func doIt(@noescape code: () -> ()) {
    /* what we CAN */
    // just call it
    code()
    // pass it to another function as another `@noescape` parameter
    doItMore(code)
    // capture it in another `@noescape` closure
    doItMore {
        code()
    }
    
    /* what we CANNOT do *****
    
    // pass it as a non-`@noescape` parameter
    dispatch_async(dispatch_get_main_queue(), code)
    // store it
    let _code:() -> () = code
    // capture it in another non-`@noescape` closure
    let __code = { code() }
    
    */
}




func justDoIt(@noescape code: () -> ()) {
    print("Testing execution flow here!!!")
    code()
}

class Bar {
    var i = 0
    func some() {
        justDoIt {
            print(i)
            //      ^ we don't need `self.` anymore!
        }
    }
}

let bar = Bar()
bar.some() // -> outputs 0


//Mark: Experimeting with if let, guard, try (optional unwrapping ?)

class ListItem {
    var icon: UIImage?
    var title: String = ""
    var url: NSURL!
    
    //Simple for conversions dictionary to ListItem model.
    static func listFromJSONData(jsonData: NSData?) -> [ListItem] {
        guard let nonilJsonData = jsonData,
            let json = try? NSJSONSerialization.JSONObjectWithData(nonilJsonData, options: []),
            let jsonItems = json as? Array<NSDictionary>
            else {
                return[]
        }
        var items = [ListItem]()
        //Instead of for we can use .map function to interate through the array
        for itemDesc in jsonItems {
            
            let item = ListItem()
            if let itemTitle = itemDesc["title"] as? String{
                item.title = itemTitle;
            }
            if let itemIcon = itemDesc["icon"] as? String {
                item.icon = UIImage(named: itemIcon)
            }
            if let itemURL = itemDesc["url"] as? String, let url = NSURL(string: itemURL){
                item.url = url
            }
            items.append(item)
        }
        return items
    }
    
    //Map use instead of for
    static func listFromJSONDataWithMap(jsonData: NSData?) -> [ListItem] {
        
        guard let nonilJsonData = jsonData,
            let json = try? NSJSONSerialization.JSONObjectWithData(nonilJsonData, options: []),
            let jsonItems = json as? Array<NSDictionary>
            else {
                return[]
        }
        return jsonItems.map { (itemDesc: NSDictionary) -> ListItem in
            let item = ListItem()
            if let itemTitle = itemDesc["title"] as? String{
                item.title = itemTitle;
            }
            if let itemIcon = itemDesc["icon"] as? String {
                item.icon = UIImage(named: itemIcon)
            }
            if let itemURL = itemDesc["url"] as? String, let url = NSURL(string: itemURL) {
                item.url = url
            }
            return item;
        }
    }
    
    //FlatMap use
    static func listFromJSONDataWithflatMap(jsonData: NSData?) -> [ListItem] {
        
        guard let nonilJsonData = jsonData,
            let json = try? NSJSONSerialization.JSONObjectWithData(nonilJsonData, options: []),
            let jsonItems = json as? Array<NSDictionary>
            else {
                return[]
        }
        //Difference between map and flatmap is that of return type optional
        return jsonItems.flatMap { (itemDesc: NSDictionary) -> ListItem? in
            //Extra check if any of the title, icon or url is corrupted then don't create the item instance.
            //This is just to check if provided dictionary doesn't miss any value.
            guard let itemTitle = itemDesc["title"] as? String,
                let itemURL = itemDesc["url"] as? String,
                let url = NSURL(string: itemURL)
                else {
                    //Check the optional ? next in flatMap otherwise it can't return the nil from the flatMap. Took a lot of time to figure this out.
                    return nil
            }
            let item = ListItem()
            if let itemIcon = itemDesc["icon"] as? String{
                item.icon = UIImage(named: itemIcon)
            }
            item.title = itemTitle;
            item.url = url;
            return item;
        }
    }
}

ListItem.listFromJSONData(nil)
ListItem.listFromJSONDataWithMap(nil)
ListItem.listFromJSONDataWithflatMap(nil)

//var itemDict: NSDictionary?
//itemDict = ["tile":"Titanic", "iconImageName":"icon", "http://testUrl.com":"url"]
//var titleString = itemDict["title"] as? String

//MARK: Testing the longest range of double value possible
//var a = 1.0 / 81
//while(true){
//    a += 0.0000000000000001
//    print(a);
//}

//MARK: Array experimentation for replaec in range

//Hard way:
var array = [1,2,3,4,5,6,7,8,9,10]
array.replaceRange(Range(start: array.startIndex.advancedBy(1),end: array.startIndex.advancedBy(4)), with: [11,11,11,11])
array.replaceRange(Range(1...4), with: [11,11,11,11])
array.replaceRange(1...4, with: [11,11,11,11])

//the easy way
array[1...4] = [11, 11, 11, 11]
print(array)

array[1...3] = [11] // [1, 11, 5, 6, 7, 8, 9, 10]
array[1...3] = [11,11,11,11,11] // [1, 11, 11, 11, 11, 11, 5, 6, 7, 8, 9, 10]


//Use of (..<)

array[1..<5] = [21, 22]
print(array)

array[1..<2] = [31, 32, 33, 34, 35, 36]
print(array)

//Delete
array[1..<4] = []
print(array)

//Appending appendContentsOf
array[ array.endIndex ..< array.endIndex] = [51, 52, 53]
print(array)


//Better way to handle the append with subscription to range returning from inside
extension Array {
    var appendPosition: Range<Int> {
        return self.endIndex..<self.endIndex
    }
}
array[array.appendPosition] = [61, 62, 63]
print(array)



extension String {
    func isDifferentThan(value: String?) -> Bool {
        return value != nil && self != value
    }
}

//Max SequenceNumber component generation

let MAX_LIMIT = 10

func maxReached(sequenceNumber: Int) -> Bool{
    return !(sequenceNumber < MAX_LIMIT)
}

func increamentByOne(sequenceNumber: Int) -> Int{
    let currentSequenceNumber = sequenceNumber + 1;
    if maxReached(currentSequenceNumber){
        return 0;
    }
    return currentSequenceNumber;
}

func getSeqNumber(sequenceNumberString : String) -> String{
    let sequenceNumberComponents = sequenceNumberString.characters.split{$0 == "_"}.map(String.init)
    var seqIntComponent: [Int] = []
    for seqNumber in sequenceNumberComponents{
        seqIntComponent.append(Int(seqNumber) ?? 0)
    }
    
    var count = seqIntComponent.count;
    var maxReached = false
    repeat{
        var currentSeqNumber = seqIntComponent[--count]
        if currentSeqNumber < 0 { break};
        currentSeqNumber = increamentByOne(currentSeqNumber)
        if currentSeqNumber == 0{
            maxReached = true;
        }else{
            maxReached = false;
        }
        seqIntComponent[count] = currentSeqNumber
    }while(maxReached && count > 0)

    let firstSeqComponent = seqIntComponent[0]
    if firstSeqComponent == 0  {
        seqIntComponent.insert(1, atIndex: 0)
    }
    
    var completeSequenceNumber : String = ""
    
    for var i = 0; i < seqIntComponent.count; i++ {
        completeSequenceNumber = "\(completeSequenceNumber)\(seqIntComponent[i])_"
    }
    completeSequenceNumber = completeSequenceNumber.substringToIndex(completeSequenceNumber.endIndex.predecessor())
    return completeSequenceNumber;
}

//SequenceNumber has to start from 1, pass 0 as start.
var numberofComponent = 0;
var testSeqNumber = "0";
//while(numberofComponent < (10 * 10 * 10 * 10 - 1)){
//    testSeqNumber = getSeqNumber(testSeqNumber)
//    numberofComponent++;
//}

testSeqNumber = "9_9_9"
testSeqNumber = getSeqNumber(testSeqNumber)
testSeqNumber = getSeqNumber(testSeqNumber)



//Throw catch experimentation

enum ComputationError : ErrorType { case DivisionByZero}
func inverse(x :float_t) throws -> float_t{
    guard x != 0 else { throw ComputationError.DivisionByZero}
    return 1.0 / x
}

do{
    let y = try inverse(0.0)
}catch{
    print("Oops \(error)")
}

//now try with completion block
enum UserError: ErrorType { case NoData, ParsingError }
struct User {
    init(fromData: NSData) throws { /* … */ }
    /* … */
}

typealias UserBuilder = Void throws -> User

func fetchUser(completion: UserBuilder -> Void) {
    let url = NSURL(string: "http://www.google.com")
        NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) -> Void in
                completion({
                    UserBuilder in
                    if let error = error { throw error }
                    guard let data = data else { throw UserError.NoData }
                    return try User(fromData: data)
                })
            }.resume()
}

fetchUser { (userBuilder: UserBuilder) in
    do {
        let user = try userBuilder()
    } catch {
        print("Async error while fetching User: \(error)")
    }
}

//Result pattern
enum Result<T> {
    case Success(T)
    case Failure(ErrorType)
}

//and this is exactly what NSError did, but here you can pass your object in success. Have a look into the following

func fetchUser(completion: Result<User> -> Void) {
    let url = NSURL(string: "http://www.google.com")
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if let error = error {
                return completion( Result.Failure(error) )
            }
            guard let data = data else {
                return completion( Result.Failure(UserError.NoData) )
            }
            do {
                let user = try User(fromData: data)
                completion( Result.Success(user) )
            } catch {
                completion( Result.Failure(error) )
            }
            }.resume()
}




//MARK: Monads and Functor.
// Nested map and flatmap
//
//http://alisoftware.github.io/swift/2015/10/17/lets-talk-about-monads/

/*

1. count the characters of each word,
2. transform each count as a spelled-out number,
3. add a suffix to each,
4. percent-escape each resulting string,
5. transform each resulting string into an NSURL
*/
let formatter = NSNumberFormatter()
formatter.numberStyle = .SpellOutStyle
let string = "This is Functional Programming"
let translateURLs = string
    // Split the characters into words
    .characters.split(" ")
    // Count the number of characters on each word
    .map { $0.count }
    // Spell out this number of chars (`stringFromNumber` can return nil)
    .flatMap { (n: Int) -> String? in formatter.stringFromNumber(n) }
    // add " letters" suffix
    .map { "\($0) letters" }
    // encode the string so it can be used in an NSURL framgment after the # (the stringByAdding… method can return nil)
    .flatMap { $0.stringByAddingPercentEncodingWithAllowedCharacters(.URLFragmentAllowedCharacterSet()) }
    // Build an NSURL using that string (`NSURL(string: …)` is failable: it can return nil)
    .flatMap { NSURL(string: "https://translate.google.com/#auto/fr/\($0)") }

print(translateURLs)
// [https://translate.google.com/#auto/fr/four%20letters, https://translate.google.com/#auto/fr/two%20letters, https://translate.google.com/#auto/fr/ten%20letters, https://translate.google.com/#auto/fr/eleven%20letters]















