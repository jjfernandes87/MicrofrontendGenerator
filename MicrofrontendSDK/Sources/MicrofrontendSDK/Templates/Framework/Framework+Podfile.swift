import Foundation

extension FrameworkTemplates {
    
    static func podfile(_ podName: String) -> String {
        let template = {
            """
            source 'https://cdn.cocoapods.org/'

            platform :ios, '11.0'

            inhibit_all_warnings!
            use_frameworks!

            workspace '\(podName)'

            target '\(podName)' do
              pod 'SwiftGen', '6.5.1'  
              pod '\(podName)Interface', :path => '../\(podName)Interface'

              target '\(podName)Tests' do
                  #pod 'Dependency', '~> 1.0.0'
              end
            end

            target 'SampleApp' do
              project 'SampleApp/SampleApp'
              pod '\(podName)', :path => './'
              pod '\(podName)Assembly', :path => '../\(podName)Assembly'

              # DI
              pod 'Swinject', '~> 2.0'
              pod 'SwinjectAutoregistration', '~> 2.0'

            end
            """
        }()
        return template
    }
}
