import Foundation

extension SampleAppTemplates {
    
    static func projectYML(_ podName: String) -> String {
        let template = {
            """
            #==================================================================================================
            # Xcodegen documentation
            # https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md#target-scheme
            #==================================================================================================

            #==================================================================================================
            name: SampleApp
            #==================================================================================================

            settings:
              MARKETING_VERSION: "1.0.0"
              SWIFT_VERSION: 5.0
              VERSIONING_SYSTEM: "apple-generic"
              CODE_SIGN_IDENTITY: "iPhone Developer"
              CLANG_ENABLE_OBJC_WEAK: "YES"
              ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES: "YES"
              ARCHS: $(ARCHS_STANDARD)

            options:
              xcodeVersion: "13.0"
              createIntermediateGroups: true
              deploymentTarget:
                iOS: "11.0"
              
            configs:
              Release: release
              Adhoc: release
              Debug: debug

            #==================================================================================================
            targets:
            #==================================================================================================

              SampleApp:

                platform: iOS
                type: application
                
                sources:
                  - path: SampleApp

                settings:
                  groups:
                    - commonSettings

                  base:
                    INFOPLIST_FILE: SampleApp/Info.plist
                  
                  configs:
                    Release:
                      PRODUCT_BUNDLE_IDENTIFIER: br.com.xpi.sample-app
                      CODE_SIGN_IDENTITY: "Apple Distribution: TECFINANCE INFORMATICA E PROJETOS DE SISTEMAS LTDA (A9VWLHHDRZ)"
                      PROVISIONING_PROFILE_SPECIFIER: "match AppStore br.com.xpi.sample-app"

                    Adhoc:
                      PRODUCT_BUNDLE_IDENTIFIER: br.com.xpi.sample-app
                      CODE_SIGN_IDENTITY: "Apple Distribution: TECFINANCE INFORMATICA E PROJETOS DE SISTEMAS LTDA (A9VWLHHDRZ)"
                      PROVISIONING_PROFILE_SPECIFIER: "match AdHoc br.com.xpi.sample-app"

                    Debug:
                      PRODUCT_BUNDLE_IDENTIFIER: br.com.xpi.sample-app
                      CODE_SIGN_IDENTITY: "Apple Development: XP Investimentos Mobile (QG89Z2TBA9)"
                      PROVISIONING_PROFILE_SPECIFIER: "match Development br.com.xpi.sample-app"

            #==================================================================================================
            projectReferences:
            #==================================================================================================
              \(podName)Project:
                path: ../\(podName).xcodeproj
            #==================================================================================================

            #==================================================================================================
            schemes:
            #==================================================================================================

            #____________________________________________________________
            # Debug

              Sample:
                build:
                  targets:
                    SampleApp: [run, archive]
                    \(podName)Project/\(podName): [run]
                  parallelizeBuild: true
                  buildImplicitDependencies: true
                run:
                  config: Debug
                archive:
                  config: Release
                  
            #==================================================================================================
            settingGroups:
            #==================================================================================================

            # Common build settings

              commonSettings:
                base:
                  CODE_SIGN_STYLE: "Manual"
                  DEVELOPMENT_TEAM: "A9VWLHHDRZ"
                  ENABLE_BITCODE: "YES"
                  TARGETED_DEVICE_FAMILY: "1"
                  ARCHS: "$(ARCHS_STANDARD)"
                  LD_RUNPATH_SEARCH_PATHS: "$(inherited) @executable_path/Frameworks"
                  OTHER_SWIFT_FLAGS: "$(inherited) -D COCOAPODS"

            #==================================================================================================

            """
        }()
        return template
    }
}
