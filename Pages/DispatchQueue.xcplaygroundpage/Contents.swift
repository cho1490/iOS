import Foundation

/*
 GCD
 Grand Central Dispatch (GCD)는 멀티코어와 프로세싱 환경에서 최적화된 프로그래밍을 할 수 있도록 애플이 개발한 기술.
 // DispatchQueue.main.sync
 // DispatchQueue.main.async
 // DispatchQueue.global().sync
 // DispatchQueue.golbal().async
 
 Dispatch Queue는 작업을 연속적 혹은 동시에 진행하기는 하지만, FIFO(First-In, First-Out)로 언제나 먼저 들어오면 먼저 나가는 순서로 실행된다.
 
 UI 작업은 Main Thread
 네트워크 작업은 비동기
 
 Serial / Concurrent - sync / async
 직렬인데 비동기 일 수도 있고, 병렬인데 동기 일 수도 있다.

 * 직렬과 병렬은 한 번에 하나만 처리하느냐 동시에 여러 개 처리하느냐에 따라 구분지어지는 것이다.

 * 동기와 비동기는 처리가 끝날 때까지 기다리느냐 지시만 하고 다른 처리를 하느냐에 따라 구분 지어지는 것이다.
 */

// MARK: - serial_sync
func serial_sync() {
    print("serial_sync() Start !!!!!!!!!!!!!!!!!!!!!")
    
    let serialQueue = DispatchQueue(label: "com.queue.Serial")
    for i in 1...5 {
        // 메인 스레드, 이미지 다운로드를 기다리면서 실행
        serialQueue.sync {
            if Thread.isMainThread {
                print("serial_sync - main thread")
            } else {
                print("serial_sync - background thread")
            }
            
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) serial_sync complete")
        }
        
        print("\(i) serial_sync executed")
    }
}



// MARK: - serial_async
 func serial_async() {
     print("serial_async() Start !!!!!!!!!!!!!!!!!!!!!")
     
     let serialQueue = DispatchQueue(label: "com.queue.Serial")
     for i in 1...5 {
         // 백그라운드 스레드, 이미지 다운로드 기다리면서 실행
       serialQueue.async {
           if Thread.isMainThread {
               print("serial_async - main thread")
           } else {
               print("serial_async - background thread")
           }
           
           let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
           let _ = try! Data(contentsOf: imgURL)
           print("\(i) serial_async complete")
       }
         
         print("\(i) serial_async executed")
     }
 }



// MARK: - concurrent_sync
func concurrent_sync() {
    print("concurrent_sync() Start !!!!!!!!!!!!!!!!!!!!!")
    
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    for i in 1...5 {
        // 메인 스레드, 이미지 다운로드 기다리면서 실행
        concurrentQueue.sync {
            if Thread.isMainThread {
                print("concurrent_sync - main thread")
            } else {
                print("concurrent_sync - background thread")
            }
            
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) concurrent_sync complete")
        }
        
        print("\(i) concurrent_sync executed")
    }
}



// MARK: - concurrent_async
func concurrent_async() {
    print("concurrent_async() Start !!!!!!!!!!!!!!!!!!!!!")
    
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    for i in 1...5 {
        // 백그라운드 스레드, 이미지 다운로드 기다리지 않고 executing 진행
        concurrentQueue.async {
            if Thread.isMainThread {
                print("concurrent_async - main thread")
            } else {
                print("concurrent_async - background thread")
            }
            
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) concurrent_async complete")
        }
        
        print("\(i) concurrent_async executing")
    }
}


//serial_sync()
//serial_sync()

//serial_async()
//serial_async()

//concurrent_sync()
//concurrent_sync()

//concurrent_async()
//concurrent_async()
