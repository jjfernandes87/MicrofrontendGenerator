import Foundation

extension FrameworkTemplates {
    
    static func swiftgenYML(_ podName: String) -> String {
        let template = {
            """
            strings:
              inputs: \(podName)/Resources/Localizable.strings
              outputs:
                - templateName: structured-swift5
                  params:
                    enumName: Localization
                  output: \(podName)/Generated/Strings.swift

            # xcassets:
            #   inputs:
            #     - \(podName)/Resources/Assets.xcassets
            #   outputs:
            #     - templateName: swift5
            #       output: \(podName)/Generated/Images.swift
            """
        }()
        return template
    }
}
