import Foundation

extension FrameworkTemplates {
    
    static func projectYML(_ podName: String) -> String {
        let template = {
            """
            #==================================================================================================
            # Xcodegen documentation
            # https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md#target-scheme
            #==================================================================================================

            #==================================================================================================
            name: \(podName)
            #==================================================================================================

            settings:
              MARKETING_VERSION: "0.1.0"
              SWIFT_VERSION: 5.0
              VERSIONING_SYSTEM: "apple-generic"
              CODE_SIGN_IDENTITY: "iPhone Developer"
              CLANG_ENABLE_OBJC_WEAK: "YES"
              ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES: "YES"
              ARCHS: $(ARCHS_STANDARD)

            options:
              xcodeVersion: "13.0"
              createIntermediateGroups: true
              developmentLanguage: "pt-BR"
              deploymentTarget:
                iOS: "11.0"

            configs:
              Debug: debug
              Release: release

            #==================================================================================================
            targets:
            #==================================================================================================

            #____________________________________________________________
            # Framework

              \(podName):

                platform: iOS
                type: framework
                
                sources:
                  - path: \(podName)

                preBuildScripts:
                  - script: "${PODS_ROOT}/SwiftGen/bin/swiftgen"
                    name: SwiftGen

                settings:
                  CODE_SIGN_STYLE: "Manual"
                  DEVELOPMENT_TEAM: ""
                  PRODUCT_BUNDLE_IDENTIFIER: br.com.microfrontendgenerator.\(podName)
                  INFOPLIST_FILE: \(podName)/Info.plist

                  ENABLE_BITCODE: "NO"
                  TARGETED_DEVICE_FAMILY: "1"
                  LD_RUNPATH_SEARCH_PATHS: "$(inherited) @executable_path/Frameworks"
                  ARCHS: $(ARCHS_STANDARD)

            #____________________________________________________________
            # Tests

              \(podName)Tests:

                platform: iOS
                type: bundle.unit-test

                sources:
                  - path: \(podName)Tests
                    excludes:
                      - "__Snapshots__"
                      - "**/__Snapshots__"
                
                dependencies:
                  - target: \(podName)

            #==================================================================================================
            schemes:
            #==================================================================================================

              \(podName)Feature:
                build:
                  targets:
                    \(podName): [run, test]
                  parallelizeBuild: true
                  buildImplicitDependencies: true
                archive:
                  config: Release
                run:
                  config: Debug
                test:
                  config: Debug
                  gatherCoverageData: true
                  coverageTargets:
                    - \(podName)
                  targets:
                    - \(podName)Tests

            #==================================================================================================
            """
        }()
        return template
    }
}
