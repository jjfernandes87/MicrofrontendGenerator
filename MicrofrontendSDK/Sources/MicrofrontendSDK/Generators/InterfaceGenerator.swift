import Foundation
import Files

class InterfaceGenerator: GeneratorType {
    
    static func generate(_ domainName: String?, _ podName: String, _ rootFolder: Folder) throws {
        do {
            
            log("Creating \(podName) interface files")
            
            let podscpec = try rootFolder.createFile(named: "\(podName)Interface.podspec")
            try podscpec.write(InterfaceTemplates.podspec(podName))
            log(podscpec)
            
            let frameworkFolder = try rootFolder.createSubfolder(named: "\(podName)Interface")
            
            let infoPLIST = try frameworkFolder.createFile(named: "Info.plist")
            try infoPLIST.write(InterfaceTemplates.infoPLIST())
            log(infoPLIST)
            
            let classesFolder = try frameworkFolder.createSubfolder(named: "Interface")
            
            let mainClass = try classesFolder.createFile(named: "\(podName).swift")
            try mainClass.write(InterfaceTemplates.mainClass(podName))
            log(mainClass)
            
        } catch {
            throw SDKMicrofeatureErrors.InterfaceCreationFailure
        }
    }
}
