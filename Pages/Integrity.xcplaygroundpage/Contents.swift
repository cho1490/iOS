import Foundation
import CryptoKit

//extension URL {
//    private static let byteCountFormatter = ByteCountFormatter()
//
//    func sizeOnDisk() throws -> String? {
//        guard let size = try directoryTotalAllocatedSize(includingSubfolders: true) else { return nil }
//        URL.byteCountFormatter.countStyle = .file
//        guard let byteCount = URL.byteCountFormatter.string(for: size) else { return nil}
//        return byteCount + " on disk"
//    }
//
//    func isDirectoryAndReachable() throws -> Bool {
//        guard try resourceValues(forKeys: [.isDirectoryKey]).isDirectory == true else {
//            return false
//        }
//        return try checkResourceIsReachable()
//    }
//
//    // returns total allocated size of a the directory including its subFolders or not
//    func directoryTotalAllocatedSize(includingSubfolders: Bool = false) throws -> Int? {
//        guard try isDirectoryAndReachable() else { return nil }
//        if includingSubfolders {
//            guard
//                let urls = FileManager.default.enumerator(at: self, includingPropertiesForKeys: nil)?.allObjects as? [URL] else { return nil }
//            return try urls.lazy.reduce(0) {
//                    (try $1.resourceValues(forKeys: [.totalFileAllocatedSizeKey]).totalFileAllocatedSize ?? 0) + $0
//            }
//        }
//        return try FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil).lazy.reduce(0) {
//                 (try $1.resourceValues(forKeys: [.totalFileAllocatedSizeKey])
//                    .totalFileAllocatedSize ?? 0) + $0
//        }
//    }
//}
//
//
//do {
//    let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//    if let sizeOnDisk = try documentDirectory.sizeOnDisk() {
//        print("size : \(sizeOnDisk)")
//    }
//} catch {
//    print("size : \(error)")
//}



//func directorySize(url: URL) -> Int64 {
//    let contents: [URL]
//    do {
//        contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: [.fileSizeKey, .isDirectoryKey])
//    } catch {
//        return 0
//    }
//
//    var size: Int64 = 0
//
//    for url in contents {
//        let isDirectoryResourceValue: URLResourceValues
//        do {
//            isDirectoryResourceValue = try url.resourceValues(forKeys: [.isDirectoryKey])
//        } catch {
//            continue
//        }
//
//        if isDirectoryResourceValue.isDirectory == true {
//            size += directorySize(url: url)
//        } else {
//            let fileSizeResourceValue: URLResourceValues
//            do {
//                fileSizeResourceValue = try url.resourceValues(forKeys: [.fileSizeKey])
//            } catch {
//                continue
//            }
//
//            size += Int64(fileSizeResourceValue.fileSize ?? 0)
//        }
//    }
//    return size
//}
//
//let documentDirectory = try FileManager.default.url(for: .allApplicationsDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
//print(directorySize(url: documentDirectory))




//extension URL {
//    var fileSize: Int? { // in bytes
//        do {
//            let val = try self.resourceValues(forKeys: [.totalFileAllocatedSizeKey, .fileAllocatedSizeKey])
//            return val.totalFileAllocatedSize ?? val.fileAllocatedSize
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//}
//
//extension FileManager {
//    func directorySize(_ dir: URL) -> Int? { // in bytes
//        if let enumerator = self.enumerator(at: dir, includingPropertiesForKeys: [.totalFileAllocatedSizeKey, .fileAllocatedSizeKey], options: [], errorHandler: { (_, error) -> Bool in
//            print(error)
//            return false
//        }) {
//            var bytes = 0
//            for case let url as URL in enumerator {
//                bytes += url.fileSize ?? 0
//            }
//            return bytes
//        } else {
//            return nil
//        }
//    }
//}
//
//let fm = FileManager.default
//let tmp = fm.temporaryDirectory
//
//if let size = fm.directorySize(tmp) {
//    print(size)
//}



//let hash = Data(SHA256.hash(data: Data()))


