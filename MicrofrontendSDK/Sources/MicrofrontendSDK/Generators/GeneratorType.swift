import Foundation
import Files

protocol GeneratorType: AnyObject {
    
    static func generate(_ domainName: String?, _ podName: String, _ rootFolder: Folder) throws
}

extension GeneratorType {
    
    static func log(_ header: String) {
        print("\n")
        print(String(repeating: "=", count: 50))
        print(">> \(header)")
        print(String(repeating: "=", count: 50))
        print("\n")
    }
    
    static func log(_ file: File) {
        print(">> Created \(file.name)")
    }
}
