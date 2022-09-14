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
let queue = DispatchQueue.global()

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
    queue.sync {
        print("조상횬")
        sleep(3)
        print("조상횬 !")
    }
    
    queue.sync {
        print("조상횬2")
        sleep(3)
        print("조상횬2 !")
    }
    
    queue.sync {
        print("조상횬3")
        sleep(3)
        print("조상횬3 !")
    }
}

func globalAsyncTest() {
    queue.async {
        print("조상횬")
        sleep(3)
        print("조상횬 !")
    }
    
    queue.async {
        print("조상횬2")
        sleep(3)
        print("조상횬2 !")
    }
    
    queue.async {
        print("조상횬3")
        sleep(3)
        print("조상횬3 !")
    }
}

mainSyncTest()
