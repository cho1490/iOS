import Foundation

/*
 Class vs Struct
 클래스와 구조체의 프로퍼티들은 반드시 초기화 되어야 한다.
 */
 
struct PersonStruct {
    
    var name: String
    var age: Int
    
}

class PersonClass {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    deinit {
        print("PersonClass deinit")
    }
        
}

let struct1: PersonStruct = PersonStruct(name: "sang", age: 24)
let class1: PersonClass = PersonClass(name: "hyun", age: 24)

var struct2: PersonStruct = struct1
let class2: PersonClass = class1

struct2.name = "sang2"
print(struct1.name)

class2.name = "hyun2"
print(class1.name)

print(class1 === class2)
