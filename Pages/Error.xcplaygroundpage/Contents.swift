import Foundation

/*
 에러 처리(Error Handling)란?
 프로그램 내에서 에러가 발생한 상황에 대해 대응하고 이를 복구하는 과정
 
 swift에서는 런타임에 에러가 발생한 경우 이를 처리하기 위한
 발생(throwig), 감지(catching), 전파(propagating), 조작(manipulating)
 을 지원하는 일급 클래스를 제공한다.
 
 Error Protocol
 빈 프로토콜이지만 에러가 발생할 수 있다는 점을 암시한다.

 public protocol Error : Sendable {
     
 }
 */

enum IntError: Error {
    case outOfRange
    case notInt
}

func stringToInt(of text: String) throws -> Int {
    if Int(text) == nil {
        throw IntError.notInt
    } else if Int(text) ?? 0 < 20 {
        throw IntError.outOfRange
    } else {
        return Int(text)!
    }
}

func main() {
    do {
        let number = try stringToInt(of: "ㅋ!")
        print("Number \(number)")
    } catch let error as IntError {
        print("catch \(error)")
    } catch {
        print("error")
    }
}

main()
