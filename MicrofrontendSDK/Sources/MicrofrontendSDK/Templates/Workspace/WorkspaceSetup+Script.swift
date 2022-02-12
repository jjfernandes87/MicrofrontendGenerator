import Foundation

extension WorkspaceSetupTemplates {
    
    static func script(_ domainName: String,_ podName: String) -> String {
        let template = {
            """
            #!/bin/bash
            
            # Jump to repository root
            cd "$(git rev-parse --show-toplevel)"

            # Setup project
            sh "cd Scripts && ./setup #{domainName}/#{podName}"

            # Open xcworkspace
            sh "cd Output/#{domainName}/#{podName}/ && open #{podName}.xcworkspace"
            
            #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            """
        }()
        return template
    }
}

