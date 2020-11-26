import Foundation

/*:
 # Property wrappers (formerly known as Property Delegates)
 Proposal: [SE-0258](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md)
 */

/*:
 Initial Motivation:
 The famous Settings Object
 */

struct Settings {
    static var newAwesomeFeature: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "awesomeFeature")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "awesomeFeature")
        }
    }

    static var environment: String? {
        get {
            return UserDefaults.standard.string(forKey: "environment")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "environment")
        }
    }
}

//set to nil again to make sure it does not have values from other playground pages
UserDefaults.standard.setValue(nil, forKey: "environment")

print("Environment: \(Settings.environment ?? "")")
Settings.environment = "Almost Prod"
print("Environment: \(Settings.environment ?? "")")
print("User Default Value: \(UserDefaults.standard.string(forKey: "environment") ?? "")")

//: [Next](@next)
