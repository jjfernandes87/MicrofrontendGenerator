import Foundation
import Files

class AssemblyGenerator: GeneratorType {
    
    static func generate(_ domainName: String?, _ podName: String, _ rootFolder: Folder) throws {
        do {
            
            log("Creating \(podName) assembly files")
            
            let podscpec = try rootFolder.createFile(named: "\(podName)Assembly.podspec")
            try podscpec.write(AssemblyTemplates.podspec(podName))
            log(podscpec)
            
            let frameworkFolder = try rootFolder.createSubfolder(named: "\(podName)Assembly")
            
            let infoPLIST = try frameworkFolder.createFile(named: "Info.plist")
            try infoPLIST.write(AssemblyTemplates.infoPLIST())
            log(infoPLIST)
            
            let classesFolder = try frameworkFolder.createSubfolder(named: "DependencyInjection")
            
            let mainClass = try classesFolder.createFile(named: "\(podName)Assembly.swift")
            try mainClass.write(AssemblyTemplates.mainClass(podName))
            log(mainClass)
            
        } catch {
            throw SDKMicrofeatureErrors.AssemblyCreationFailure
        }
    }
}
