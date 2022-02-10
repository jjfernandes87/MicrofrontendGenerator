import Foundation

extension SampleAppTemplates {
    
    static func assetsContentsJSON() -> String {
        let template = {
            """
            {
              "info" : {
                "version" : 1,
                "author" : "xcode"
              }
            }
            """
        }()
        return template
    }
}
