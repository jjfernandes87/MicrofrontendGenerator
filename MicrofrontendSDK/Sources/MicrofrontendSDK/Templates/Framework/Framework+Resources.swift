import Foundation

extension FrameworkTemplates {
    
    static func resourcesClass() -> String {
        let template = {
            """
            // MARK: - Feature

            "Feature.Example.HelloWorld" = "Hello World from FrontendModule!!";
            """
        }()
        return template
    }
}
