import UIKit

/*
 자동 참조 카운트 ARC(Automatic Reference Counting)
 Swift에서는 앱의 메모리 사용을 관리하기 위해 ARC(Automatic Reference Counting)을 사용합니다.
 
 자동으로 참조 횟수를 관리하기 때문에 대부분의 경우에 개발자는 메모리 관리에 신경쓸 필요가 없고 ARC가 알아서 더이상 사용하지 않는 인스턴스를 메모리에서 해지합니다.
 하지만 몇몇의 경우 ARC에서 메모리 관리를 위해 코드의 특정 부분에 대한 관계에 대한 정보를 필요로 합니다.
 참조 횟수는 클래스 타입의 인스턴스에만 적용되고 값 타입인 구조체 열거형 등에는 적용되지 않습니다.
 */

class Person {

    var apartment: Apartment?
    var changedApartment: ChangedApartment?
    var name: String
    
    init(name: String) {
        self.name = name
        print("Person init()")
    }
    
    deinit {
        print("Person deinit")
    }

}

/*
 var person1: Person? = Person(name: "csh") // person1 RC = 1 / init()
 var person2: Person?
 var person3: Person?

 person2 = person1 // person1 RC = 2
 person3 = person1 // person1 RC = 3
 person1 = nil // person1 RC = 2
 person2 = nil // person1 RC = 1
 person3 = nil // person1 RC = 0 / deinit
 */
 


/*
 순환 참조 : 두 개의 객체가 서로 참조하고 있는 형태를 말한다.
 강한 참조 순환 (Strong Reference Cycles Between Class Instances)
 클래스의 인스턴스간 강하게 상호 참조를 하고 있는 경우 절대로 메모리에서 해제 되지 않는다.
 */

// MARK: - strong 참조

class Apartment {
    
    var person: Person?
    let unit: String
    
    init(unit: String) {
        self.unit = unit
        print("Apartment init()")
    }
    
    deinit {
        print("Apartment deinit")
    }
    
}

/*
 var person1: Person? = Person(name: "csh") // person1 RC = 1
 var apartment1: Apartment? = Apartment(unit: "csh apartment") // apartment1 RC = 1

 person1!.apartment = apartment1
 apartment1!.person = person1
 // person4 RC = 2, apartment1 RC = 2

 person1 = nil // person4 RC = 1
 apartment1 = nil // apartment1 RC = 1
 // 메모리 누수
 */

/*
 문제의 해결
 weak, unowned 참조
 weak 참조, unowned 참조 모두 ARC에서 참조 횟수를 증가시키지 않고 인스턴스를 참조한다.
 weak 참조는 참초하고 있는 인스턴스가 먼저 메모리에서 해제될 때 사용한다.
 unowned 참조는 참조하고 있는 인스턴트가 같은 시점 혹은 더 뒤에 해제될 때 사용한다.
 */

// MARK: - weak 참조

class ChangedApartment {
    
    weak var person: Person?
    let unit: String
    
    init(unit: String) {
        self.unit = unit
        print("Apartment init()")
    }
    
    deinit {
        print("Apartment deinit")
    }
    
}

/*
 var person1: Person? = Person(name: "csh")
 var changedApartment1: ChangedApartment? = ChangedApartment(unit: "csh apartment")

 person1!.changedApartment = changedApartment1
 changedApartment1!.person = person1

 person1 = nil // person1 RC = 0 / deinit
 changedApartment1 = nil // changedApartment1 RC = 0 / deinit
 */

// MARK: - unowned 참조

class Customer {
    
    var card: CreditCard?
    let name: String
    
    init(name: String) {
        self.name = name
        print("Customer init()")
    }
    
    deinit {
        print("Customer deinit")
    }
    
}

class CreditCard {
    
    unowned let customer: Customer
    let number: UInt64
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
        print("CreditCard init()")
    }
    
    deinit {
        print("CreditCard deinit")
    }
    
}

/*
 var customer1: Customer? = Customer(name: "csh")
 customer1!.card = CreditCard(number: 1234_5678_9012_3456, customer: customer1!) // CreditCard init()
 customer1 = nil // CreditCard deinit
 */



/*
 클로저에서의 강한 참조 순환 (Strong Reference Cycles for Closures)
 강한 참조 순환은 변수 뿐만아니라 클로저와 관계돼서 발생할수도 있다.
 클로저에서는 self를 캡쳐하기 때문이다.
 이 문제를 해결 하기 위해서는 클로저 캡쳐 리스트를 사용한다.
 */

// MARK: - 클로저에서 강한 참조 순환

class HTMLElement {

    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
//        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        print("HTMLElement init()")
    }
    
    deinit {
        print("HTMLElement deinit")
    }
    
}

/*
 var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world!")
 print(paragraph!.asHTML())
 paragraph = nil // asHTML() 클로저의 self를 "[unowned self] in"로 설정 / HTMLElement deinit
 */
