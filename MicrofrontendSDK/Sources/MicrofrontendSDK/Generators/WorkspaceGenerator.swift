import Foundation
import Files

class WorkspaceGenerator: GeneratorType {
    
    static func generate(_ domainName: String?, _ podName: String, _ rootFolder: Folder) throws {
        do {
            
            let script = try rootFolder.createFile(named: "genWorkspace.sh")
            try script.write(WorkspaceTemplates.script(podName))
            
            let terminalTask = Process()
            terminalTask.launchPath = "/bin/bash"
            terminalTask.arguments = ["-c", "sh genWorkspace.sh"]
            try terminalTask.run()
            terminalTask.waitUntilExit()
            
            try script.delete()
            
        } catch {
            throw SDKMicrofeatureErrors.WorkspaceGenerationFailure
        }
    }
}

