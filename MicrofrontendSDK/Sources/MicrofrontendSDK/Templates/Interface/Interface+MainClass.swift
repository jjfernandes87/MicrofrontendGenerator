import Foundation

extension InterfaceTemplates {
    
    static func mainClass(_ podName: String) -> String {
        let template = {
            """
            //
            //  \(podName)Interface.swift
            //  \(podName)Interface
            //

            import Foundation

            public protocol \(podName)Interface {
                func helloWorld() -> String
            }

            """
        }()
        return template
    }
}
