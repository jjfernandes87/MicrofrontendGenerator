import Foundation
import Files

public final class CommandLineTool {
    
    private let arguments: [String]
    private var domainName: String?
    private var podFeaturesName: String?

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
        domainName = arguments.object(index: 1)
        podFeaturesName = arguments.object(index: 2)
    }

    public func run() throws {
        do {
            
            guard let domainName = domainName, !domainName.isEmpty else {
                throw SDKMicrofeatureErrors.MissingNameArgument
            }

            logStart()

            guard let podFeaturesName = podFeaturesName?.components(separatedBy: ","), podFeaturesName.count > 0 else {
                
                let domainFolder = try Folder.current.createSubfolder(named: domainName)
                let podFolder = try domainFolder.createSubfolder(named: domainName)
                let interfaceFolder = try domainFolder.createSubfolder(named: "\(domainName)Interface")
                let assemblyFolder = try domainFolder.createSubfolder(named: "\(domainName)Assembly")
                
                try FrameworkGenerator.generate(domainName, podFolder)
                try InterfaceGenerator.generate(domainName, interfaceFolder)
                try AssemblyGenerator.generate(domainName, assemblyFolder)
                try SampleAppGenerator.generate(domainName, podFolder)
                try WorkspaceGenerator.generate(domainName, Folder.current)
                
                logEnd(domainName)
                
                return
            }
            
            let domainFolder = try Folder.current.createSubfolder(named: domainName)

            for podName in podFeaturesName {
                let podFolder = try domainFolder.createSubfolder(named: podName)
                let interfaceFolder = try domainFolder.createSubfolder(named: "\(podName)Interface")
                let assemblyFolder = try domainFolder.createSubfolder(named: "\(podName)Assembly")
                
                try FrameworkGenerator.generate(podName, podFolder)
                try InterfaceGenerator.generate(podName, interfaceFolder)
                try AssemblyGenerator.generate(podName, assemblyFolder)
                try SampleAppGenerator.generate(podName, podFolder)
            }

            try WorkspaceGenerator.generate(domainName, Folder.current)

            logEnd(domainName)

        } catch {
            throw error
        }
    }
}
