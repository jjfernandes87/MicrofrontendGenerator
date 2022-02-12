import Foundation

extension WorkspaceTemplates {
    
    static func script(_ podName: String) -> String {
        let template = {
            """
            #!/bin/bash
            
            # Jump to repository root
            cd "$(git rev-parse --show-toplevel)"

            # Verify if folder already exists
            if [ ! -d "./Output/\(podName)" ]; then
                echo ">> Creating \(podName) module in the root\n"
                cp -R "MicrofrontendSDK/\(podName)" "Output/\(podName)"
            else
                echo ">> \(podName) folder already exists";
            fi

            # Check the file is exists or not
            rm -rf "MicrofrontendSDK/\(podName)"
            echo ">> \(podName) was removed in the MicrofrontendSDK"
            
            #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            """
        }()
        return template
    }
}

