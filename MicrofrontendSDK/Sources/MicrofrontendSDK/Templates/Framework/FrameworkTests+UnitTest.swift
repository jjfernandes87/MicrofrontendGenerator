import Foundation

extension FrameworkTemplates {
    
    static func unitTest(_ podName: String) -> String {
        let template = {
            """
            //
            //  \(podName)Tests.swift
            //  \(podName)Tests
            //

            import XCTest
            @testable import \(podName)

            final class \(podName)Tests: XCTestCase {
                let sut = \(podName)(localizationString: "test ")
                func test_helloWorld() {
                    let result = sut.helloWorld()
                    XCTAssertEqual(result, "test Hello World from FrontendModule!!")
                }
            }
            """
        }()
        return template
    }
}
