import Foundation

extension WorkspaceSetupTemplates {
    
    static func script(_ domainName: String, _ podName: String) -> String {
        let template = {
            """
            #!/bin/bash
            
            # Jump to repository root
            cd "$(git rev-parse --show-toplevel)"

            # Setup project
            cd Scripts && ./setup \(domainName)/\(podName)

            # Jump to repository root
            cd "$(git rev-parse --show-toplevel)"

            # Open xcworkspace
            cd Output/\(domainName)/\(podName)/ && open \(podName).xcworkspace
            
            #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            """
        }()
        return template
    }
}

