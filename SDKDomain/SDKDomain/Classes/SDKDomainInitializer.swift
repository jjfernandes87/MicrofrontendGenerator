//
//  SDKDomainInitializer.swift
//  SDKDomain
//

import Foundation

public final class SDKDomainInitializer {
    
    @discardableResult public class func helloWorld() -> String {
        let message = Localization.Feature.Example.helloWorld
        print(message)
        return message
    }
    
}