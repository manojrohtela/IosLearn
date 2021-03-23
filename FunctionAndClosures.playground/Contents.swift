import UIKit

func normalFunc(){
    print("This is normal function")
}

/// using function types
func addTwoNumbers(value:Int,value2:Int)->Int{
    return (value+value2)
}

var mathsFunc:(Int,Int)->Int = addTwoNumbers

print(mathsFunc(3,4))

/// inout parameters
func inoutFunction( param1:inout Int){
    param1 = 5
    print(param1)
}
var param2 = 6
inoutFunction(param1: &param2)
print(param2)


/// variadic parameters
/// means we can send mlitple value of parameters
func variadicFunc(param:Int...){
    print(param)
}

variadicFunc(param: 1,2,4,5,6,7,8)


/// Closures
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1:String,_ s2:String)->Bool{
    s1>s2
}

var reversedNames = names.sorted(by: backward)

///Closures Expression Syntax
/**
 { (parameters) -> return type in
     statements
 }
 */

/// in :- definition of closure finished and body is about to begin

reversedNames = names.sorted(by: { (s1, s2) -> Bool in
    s2>s1
})
reversedNames = names.sorted(by: {s1,s2 in s1>s2})
print(reversedNames)


reversedNames = names.sorted(by: {$0 < $1})
reversedNames = names.sorted(by: >)


/// Trailing closures
/// completionhandler is example of trailing closure
func someFunctionThatTakesAClosure(closure:()->Void){
    // Function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

someFunctionThatTakesAClosure() {
    
}
reversedNames = names.sorted(){$0>$1}


func loadPictures(picture:String,completion:(String)->Void,onFailure:(Bool)->Void){
    if picture == ""{
        completion(picture)
    } else {
        onFailure(true)
    }
}


/// map function
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16,58,510]
let stringsValue = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number%10]! + output
        number /= 10
    }while number > 0
    return output
}

print(stringsValue)


/// Escapijng and non escaping closures
/**
 Nonescaping closure
 Life cycle of non-escaping closure
 1. Pass a closure into a function
 2. The function executes that closure
 3. The function returns
 */

/**
 Escaping closure present in memory untill it contnets is executed
 */


/// Capture list

/// any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more.
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result = travel()
result("London")
result("London")
result("London")
result("London")

