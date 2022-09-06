import Foundation

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

