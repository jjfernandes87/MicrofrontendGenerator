import Foundation

extension FrameworkTemplates {
    
    static func podspec(_ podName: String) -> String {
        let template = {
            """
            Pod::Spec.new do |spec|

              spec.name = '\(podName)'
              spec.version = '0.1.0'
              spec.summary = 'Micro feature description.'
              spec.homepage = 'https://github.com/jjfernandes87/MicrofrontendGenerator'
              spec.author = { 'Framework Author' => "author@email.com" }
              spec.license = { :type => 'Private' }
              spec.source = { :git => 'https://github.com/jjfernandes87/MicrofrontendGenerator',
                              :tag => spec.version.to_s }

              spec.ios.deployment_target = '11.0'
              spec.requires_arc = true

              spec.cocoapods_version = '>= 1.5'
              spec.swift_version = '5.0'

              spec.source_files = '\(podName)/**/*.{h,m,swift}'

              spec.resource_bundles = {
                '\(podName)' => [
                  '\(podName)/**/*.xcassets',
                  '\(podName)/**/*.xib'
                ]
              }

              spec.resources = [
                '\(podName)/**/*.strings'
              ]

              spec.dependency '\(podName)Interface'

            end
            """
        }()
        return template
    }
}
