import Foundation

extension FrameworkTemplates {
    
    static func mainClass(_ podName: String) -> String {
        let template = {
            """
            //
            //  \(podName)Initializer.swift
            //  \(podName)
            //

            import Foundation
            import \(podName)Interface

            public final class \(podName)Initializer {
               
                private let localizationString: String
                public init(localizationString: String) {
                    self.localizationString = localizationString
                }
                
            }

            extension \(podName)Initializer: \(podName)Interface {
                
                @discardableResult public func helloWorld() -> String {
                    let message = localizationString + Localization.Feature.Example.helloWorld
                    print(message)
                    return message
                }

            }

            """
        }()
        return template
    }
}
