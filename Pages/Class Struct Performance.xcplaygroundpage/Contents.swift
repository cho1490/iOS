import Foundation
import QuartzCore

class ClassType {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}

struct StructType {
    var value: Int
}

// MARK: - Class 와 Struct 의 생성 속도 비교
func timeTest(comment: String, closure: () -> Void) {
    let startTime = CACurrentMediaTime()
    closure()
    print("\(comment) - Time : \(CACurrentMediaTime() - startTime)")
}

func main1() {
    timeTest(comment: "Class Test") {
        for i in 0 ..< 10000 {
            let _ = ClassType(value: i)
        }
    }

    timeTest(comment: "Struct Test") {
        for i in 0 ..< 10000 {
            let _ = StructType(value: i)
        }
    }
}
//main1()

// MARK: - Class 와 Struct 의 대입 속도 비교
let classType = ClassType(value: 1)
let structType = StructType(value: 1)

func main2() {
    timeTest(comment: "Class Test") {
        for _ in 0 ..< 10000 {
            let _ = classType
        }
    }

    timeTest(comment: "Struct Test") {
        for _ in 0 ..< 10000 {
            let _ = structType
        }
    }
}
//main2()

// MARK: - 주소값 확인 copy-on-write, 대입할 때 복사가 일어나는 것이 아닌, 수정이 발생할 때 값이 복사
func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

func main3() {
    // Struct Test
    var array = [1, 2, 3]
    var array2 = array
    
    address(of: &array)
    address(of: &array2)
 
    array2.append(4)
    address(of: &array)
    address(of: &array2) // 주소값 달라짐
}
//main3()
