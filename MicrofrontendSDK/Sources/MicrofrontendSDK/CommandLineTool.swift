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
                
                let podName = domainName
                
                let domainFolder = try Folder.current.createSubfolder(named: podName)
                let podFolder = try domainFolder.createSubfolder(named: podName)
                let interfaceFolder = try domainFolder.createSubfolder(named: "\(podName)Interface")
                let assemblyFolder = try domainFolder.createSubfolder(named: "\(podName)Assembly")
                
                try FrameworkGenerator.generate(nil, podName, podFolder)
                try InterfaceGenerator.generate(nil, podName, interfaceFolder)
                try AssemblyGenerator.generate(nil, podName, assemblyFolder)
                try SampleAppGenerator.generate(nil, podName, podFolder)
                try WorkspaceGenerator.generate(nil, podName, Folder.current)
                
                logEnd(podName)
                
                return
            }
            
            let domainFolder = try Folder.current.createSubfolder(named: domainName)

            for podName in podFeaturesName {
                let podFolder = try domainFolder.createSubfolder(named: podName)
                let interfaceFolder = try domainFolder.createSubfolder(named: "\(podName)Interface")
                let assemblyFolder = try domainFolder.createSubfolder(named: "\(podName)Assembly")
                
                try FrameworkGenerator.generate(nil, podName, podFolder)
                try InterfaceGenerator.generate(nil, podName, interfaceFolder)
                try AssemblyGenerator.generate(nil, podName, assemblyFolder)
                try SampleAppGenerator.generate(nil, podName, podFolder)
            }

            try WorkspaceGenerator.generate(nil, domainName, Folder.current)

            for podName in podFeaturesName {
                try WorkspaceSetup.generate(domainName, podName, Folder.current)
            }

            logEnd(domainName)

        } catch {
            throw error
        }
    }
}
