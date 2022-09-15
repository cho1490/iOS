import Foundation

/*
 GCD
 Grand Central Dispatch (GCD)는 멀티코어와 프로세싱 환경에서 최적화된 프로그래밍을 할 수 있도록 애플이 개발한 기술.
 // DispatchQueue.main.sync
 // DispatchQueue.main.async
 // DispatchQueue.global().sync
 // DispatchQueue.golbal().async
 */

let mainQueue = DispatchQueue.main
let globalQueue = DispatchQueue.global() // DispatchQueue.global(qos: .default)

func mainSyncTest() {
    mainQueue.sync {
        print("조상횬")
        sleep(3)
        print("조상횬 !")
    }
    
    mainQueue.sync {
        print("조상횬2")
        sleep(3)
        print("조상횬2 !")
    }
    
    mainQueue.sync {
        print("조상횬3")
        sleep(3)
        print("조상횬3 !")
    }
}


func mainAsyncTest() {
    mainQueue.async {
        print("조상횬")
        sleep(3)
        print("조상횬 !")
    }
    
    mainQueue.async {
        print("조상횬2")
        sleep(3)
        print("조상횬2 !")
    }
    
    mainQueue.async {
        print("조상횬3")
        sleep(3)
        print("조상횬3 !")
    }
}

func globalSyncTest() {
    globalQueue.sync {
        print("조상횬")
        sleep(3)
        print("조상횬 !")
    }
    
    globalQueue.sync {
        print("조상횬2")
        sleep(3)
        print("조상횬2 !")
    }
    
    globalQueue.sync {
        print("조상횬3")
        sleep(3)
        print("조상횬3 !")
    }
}

func globalAsyncTest() {
    globalQueue.async {
        print("조상횬")
        sleep(3)
        print("조상횬 !")
    }
    
    globalQueue.async {
        print("조상횬2")
        sleep(3)
        print("조상횬2 !")
    }
    
    globalQueue.async {
        print("조상횬3")
        sleep(3)
        print("조상횬3 !")
    }
}

//mainSyncTest() // 데드락!
//mainAsyncTest()
//globalSyncTest()
//globalSyncTest()


// MARK: - GROUP
let myGroup = DispatchGroup()

func groupTest() {
    globalQueue.async(group: myGroup) {
        print("상횬 1")
        sleep(5)
        print("상횬 1 끝")
    }
    
    globalQueue.async(group: myGroup) {
        print("상횬 2")
        myGroup.enter()
        globalQueue.async {
            print("상횬 4")
            sleep(10)
            print("상횬 4 끝")
            myGroup.leave()
        }
        print("상횬 2 끝")
    }
    
    globalQueue.async(group: myGroup) {
        print("상횬 3")
        sleep(2)
        print("상횬 3 끝")
    }
    
    myGroup.notify(queue: .main) {
        print("상횬 끝")
    }
}

groupTest()
