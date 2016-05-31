//: Playground - noun: a place where people can play

import UIKit

var str = "Hi, playground"



var webmontag: String = "Hi, Webmontag!"
webmontag = "Hello, Webmontag!"
webmontag.dynamicType

let webmontag1 = "Hi, Webmontag!"
//webmontag1 = "Hello, Webmontag!"
webmontag1.dynamicType

var webmontag2: String?
webmontag2
webmontag2 = "Hi"
webmontag2.dynamicType
webmontag2!

// ctlr cmd space
let 😳 = webmontag
😳.dynamicType

func duplicate(y: String) -> String {
    return y + " " + y
}

duplicate(😳)

extension String {
    func duplicate() -> String {
        return self + " " + self
    }
}

😳.duplicate()

extension String {
    static let o_O = "😳"
}

String.o_O

String.o_O.duplicate()


extension Bool {
    func flipBool() -> Bool {
        
        if (self == true) {
            return false
        }
        else {
            return true
        }
    }
}

var bool = true
bool.flipBool()
bool

extension Bool {
    mutating func flip() {
    
        if (self == true) {
            self = false
        }
        else {
            self = true
        }
    }
}

bool
bool.flip()
bool


let array = [1, 2, 3]
//array += [4, 5]

var array1 = [1, 2, 3]
array1 += [4, 5]

array.dynamicType
array1.dynamicType

var array2 = ["a", "b", "c"]
array2.dynamicType

["a", 1].dynamicType

let range = 0..<3
range.dynamicType

extension CollectionType {
    func concat() -> String {
        var result = ""
        self.forEach { (e: Self.Generator.Element) in
            result += (e as! NSObject).description
        }
        return result
    }
}

array.concat()
array1.concat()
array2.concat()

extension CollectionType where Generator.Element == Int {
    func sum() -> Int {
        var result = 0
        self.forEach { (e: Int) in
            result += e 
        }
        return result
    }
}

array.sum()
array1.sum()
//array2.sum()

postfix operator +++++ {}
postfix func +++++(list: [Int]) -> Int {
    return list.sum()
}

array+++++
array1+++++

infix operator +++++ {}
func +++++(list1: [Int], list2: [Int]) -> Int {
    return list1.sum() + list2.sum()
}

array +++++ array1

class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func say() {
        print("My name is \(name).")
    }
}

class Attendee : Person {}

class Presenter : Person {}

protocol Speaker {
    func greet()
}

extension Presenter : Speaker {
    func greet() {
        print("Hello, Webmontag!")
    }
}

class PizzaDeliverer : Attendee {
    func collect() {
        print("Where is my money?")
    }
}

class Webmontag {
    
    var presenter: Presenter? {
        willSet {
//            if (newValue != nil) {
//                newValue!.greet()
//                newValue!.say()
//            }
            
//            if let myNewVal = newValue {
//                myNewVal.greet()
//                myNewVal.say()
//            }
            
//            guard newValue != nil else {
//                return
//            }
//            newValue!.greet()
//            newValue!.say()
            
            guard let myNewVal = newValue else {
                return
            }
            myNewVal.greet()
            myNewVal.say()
        }
    }
    
    var attendees: [Attendee] = [Attendee]()

    func attendeeComesIn(attendee: Attendee) {
        
        attendee.say()
        
        guard (attendee as? PizzaDeliverer) == nil else {
            (attendee as! PizzaDeliverer).collect()
            return
        }
        
        attendees.append(attendee)
        print("Attendees: \(attendees.count)")
    }
    
    
    subscript(index: String) -> Attendee? {
        get {
            let filtered =  attendees.filter({ (a: Attendee) -> Bool in
                index == a.name
            })
            return filtered.count == 0 ? nil : filtered[0]
        }
//        set(value) {
//            dict[index] = value
//        }
    }
    
}

let wm = Webmontag()
wm.presenter = Presenter(name: "Patrick")

wm.presenter = Presenter(name: "Seppel")

wm.presenter = nil

wm.attendeeComesIn(Attendee(name: "Horst"))
wm.attendeeComesIn(Attendee(name: "Another Horst"))
wm.attendeeComesIn(PizzaDeliverer(name: "Dino"))

let pd = Attendee(name: "Raju")

(pd as? PizzaDeliverer).dynamicType
//(pd as! PizzaDeliverer).dynamicType

wm["Holger"]
wm["Horst"]

//GetterSetter
//closure:()->()