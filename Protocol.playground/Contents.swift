import UIKit

protocol firstProtocol{
    
}
extension firstProtocol{
    func extend(){
        print("First Protocol")
    }
}

protocol secondProtocol{
    
}
extension secondProtocol{
    func extend(){
        print("Second Protocol")
    }
}


struct newStruct:firstProtocol,secondProtocol{
    
}

let structObject = newStruct()
#warning("We can't use same name in extension or we have to define it also in class or struct")
//structObject.extend()

// MARK:- Static dispatch and dynamic dispatch
protocol movable{
    func walk()
    //func crawl()//Add or remove this method to check how Dynamic dispatch works
}
extension movable{
    func crawl(){
        print("Default Crawling")
    }
}

struct Animal:movable{
    func walk() {
        print("Animal is walking proudly")
    }
    func crawl() {
        print("Animal is crawling silently")
    }
    
}

//let panda = Animal()
//panda.walk()
//panda.crawl()

let raccoon = Animal()
raccoon.walk()
raccoon.crawl()

// MARK:- So here happens static dispatch we have directly conform protocol so swift pointer move to default protocol
let wolf:movable = Animal()
wolf.walk()
wolf.crawl()

// MARK:- Property Requirements
#warning("The protocol doesn’t specify whether the property should be a stored property or a computed property—it only specifies the required property name and type. The protocol also specifies whether each property must be gettable or gettable and settable.")


protocol someProcol{
    var mustBeSettable:Int{get set}
    var doesNotNeedToBeSettable:Int{get}
}

protocol FullyName{
    var fullyName: String{get}
}

struct personName:FullyName{
    var fullyName: String
}

let john = personName(fullyName: "John mac")

class StarShip:FullyName{
    var prefix:String?
    var name:String
    
    init(name:String,prefix:String) {
        self.prefix = prefix
        self.name = name
    }
    var fullyName: String{
        return (prefix != nil ? prefix!+" " : "") + name
    }
}

var ncc1701 = StarShip(name: "Manoj Kumar", prefix: "Mr.")
print(ncc1701.fullyName)

// MARK:- protocol with initializer requirement
protocol someprotocolWithInit{
    init(someParameter:Int)
}

class structWithInitProtocol:someprotocolWithInit{
    required init(someParameter: Int) {
        
    }
}

/**
    You can use a protocol in many places where other types are allowed, including:

    As a parameter type or return type in a function, method, or initializer
    As the type of a constant, variable, or property
    As the type of items in an array, dictionary, or other container
*/

