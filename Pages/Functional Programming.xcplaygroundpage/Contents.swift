import Foundation

// MARK: - 함수를 매개변수로 사용
func add(a: Int, b: Int) -> Int {
    return a + b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

// 1
func calculation(a: Int, b: Int, c: String) {
    if c == "a" {
        print("calculation : \(add(a: a, b: b))")
    } else if c == "m" {
        print("calculation : \(multiply(a: a, b: b))")
    }
}

// 2
func calculation2(a: Int, b: Int, function: (Int, Int) -> Int) {
    print("calculation2 : \(function(a, b))")
}

calculation(a: 2, b: 3, c: "a")
calculation(a: 2, b: 3, c: "m")
calculation2(a: 2, b: 3, function: add)
calculation2(a: 2, b: 3, function: multiply)




// MARK: - 고차 함수 //
struct Person {
    var name: String
    
    func isValid() -> Bool {
        return true
    }
}

var names: [String] = ["상현", "상현2", "상현3", "상현이", "조상현"]


var persons: [Person] = []
for name in names {
    let person = Person(name: name)
    if person.isValid() {
        persons.append(person)
    }
}


var possiblePersons: [Person] = []
for name in names {
    let person = Person(name: name)
    possiblePersons.append(person)
}

var persons2: [Person] = []
for person in possiblePersons {
    if person.isValid() {
        persons2.append(person)
    }
}


let possiblePersons2 = names.map(Person.init)
let persons3 = possiblePersons2.filter { $0.isValid() }

// Map, Filter //
let persons4 = names
    .map(Person.init)
    .filter { $0.isValid() }


func printPerson(persons: [Person]) {
    for person in persons {
        print("person name : \(person.name)\n")
    }
    
    print("----------------------------")
}

printPerson(persons: persons)
printPerson(persons: persons2)
printPerson(persons: persons3)
printPerson(persons: persons4)

