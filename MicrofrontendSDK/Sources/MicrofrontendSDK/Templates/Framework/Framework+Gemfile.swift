//
//  Framework+Gemfile.swift
//  PodGenerator
//
//  Created by Cauê Alves on 21/03/20.
//

import Foundation

extension FrameworkTemplates {
    
    static func gemfile() -> String {
        let template = {
            """
            source "https://rubygems.org"
            
            gem "xcpretty"
            gem "cocoapods", '1.10.2'
            gem "xcode-install"
            """
        }()
        return template
    }
}
