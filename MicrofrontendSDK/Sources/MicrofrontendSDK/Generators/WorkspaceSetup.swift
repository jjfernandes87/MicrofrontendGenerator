import Foundation
import Files

class WorkspaceSetup: GeneratorType {
    
    static func generate(_ domainName: String?, _ podName: String, _ rootFolder: Folder) throws {
        do {
            
            let script = try rootFolder.createFile(named: "genSetup.sh")
            try script.write(WorkspaceSetupTemplates.script(domainName ?? "", podName))
            
            let terminalTask = Process()
            terminalTask.launchPath = "/bin/bash"
            terminalTask.arguments = ["-c", "sh genSetup.sh"]
            try terminalTask.run()
            terminalTask.waitUntilExit()
            
            try script.delete()
            
        } catch {
            throw SDKMicrofeatureErrors.WorkspaceSetupFailure
        }
    }
}

