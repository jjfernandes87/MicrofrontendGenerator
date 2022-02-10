import Foundation

extension AssemblyTemplates {
    
    static func mainClass(_ podName: String) -> String {
        let template = {
            """
            import Foundation
            import Swinject
            import SwinjectAutoregistration

            import \(podName)Interface
            import \(podName)

            public class \(podName)Assembly: Assembly {
                
                public init() {}
                
                public func assemble(container: Container) {
                    container.register(String.self) { _ in
                        return "Hello DI!!!"
                    }
                    container.autoregister(\(podName)Interface.self, initializer: \(podName)Initializer.init)
                }
            }

            """
        }()
        return template
    }
}
