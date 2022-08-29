import UIKit

/*
 자동 참조 카운트 ARC(Automatic Reference Counting)
 Swift에서는 앱의 메모리 사용을 관리하기 위해 ARC(Automatic Reference Counting)을 사용합니다.
 
 자동으로 참조 횟수를 관리하기 때문에 대부분의 경우에 개발자는 메모리 관리에 신경쓸 필요가 없고 ARC가 알아서 더이상 사용하지 않는 인스턴스를 메모리에서 해지합니다.
 하지만 몇몇의 경우 ARC에서 메모리 관리를 위해 코드의 특정 부분에 대한 관계에 대한 정보를 필요로 합니다.
 참조 횟수는 클래스 타입의 인스턴스에만 적용되고 값 타입인 구조체 열거형 등에는 적용되지 않습니다.
 
 */

class Person {

    var person: Person? = nil
    var name: String
    
    init(name: String) {
        self.name = name
        print("init()")
    }
    
    deinit {
        print("deinit")
    }

}

var person1: Person? = Person(name: "csh")
var person2: Person?
var person3: Person?

person2 = person1
person3 = person1
// person1 RC = 3

person1 = nil
person2 = nil
// person1 RC = 1
// person3 = nil / person1 RC = 0 / deinit




// 순환 참조 : 두 개의 객체가 서로 참조하고 있는 형태를 말한다.

