import Foundation

extension SampleAppTemplates {
    
    static func viewController(_ podName: String) -> String {
        let template = {
            """
            //
            //  ViewController.swift
            //  SampleApp
            //

            import UIKit
            import Swinject
            import \(podName)
            import \(podName)Interface
            import \(podName)Assembly

            final class ViewController: UIViewController {

                var assembler: Assembler = {
                    let assembler = Assembler(
                        [
                            \(podName)Assembly()
                        ]
                    )
                    return assembler
                }()

                lazy var service = assembler.resolver.resolve(\(podName)Interface.self)
                
                override func viewDidAppear(_ animated: Bool) {
                    super.viewDidAppear(animated)
                    title = "Sample App"
                    
                    let alert = UIAlertController(title: "\(podName)", message: service?.helloWorld(), preferredStyle: .alert)
                    alert.addAction(.init(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
            }
            """
        }()
        return template
    }
}
