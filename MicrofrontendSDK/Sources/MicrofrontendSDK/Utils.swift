import Foundation

public enum SDKMicrofeatureErrors: Swift.Error {
    case MissingNameArgument
    case SampleAppCreationFailure
    case FrameworkCreationFailure
    case InterfaceCreationFailure
    case AssemblyCreationFailure
    case WorkspaceGenerationFailure
    case WorkspaceSetupFailure
}

public struct SampleAppTemplates {}
public struct FrameworkTemplates {}
public struct InterfaceTemplates {}
public struct AssemblyTemplates {}
public struct WorkspaceTemplates {}
public struct WorkspaceSetupTemplates {}

public extension CommandLineTool {
    
    func logStart() {
        print("\n")
        print(String(repeating: "=", count: 50))
        print(">> Starting Microfrontend SDK ☕️")
        print(String(repeating: "=", count: 50))
        print("\n")
    }
    
    func logEnd(_ podName: String) {
        print("\n")
        print(String(repeating: "=", count: 50))
        print(">> Microfrontend SDK successfully created \(podName) 🚀")
        print(String(repeating: "=", count: 50))
        print("\n")
    }
}

public extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}
