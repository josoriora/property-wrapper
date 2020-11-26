//: [Previous](@previous)

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        UserDefaults.standard.register(defaults: [key: defaultValue])
    }
}

struct Settings {
    @UserDefault("awesomeFeature", defaultValue: false) static var newAwesomeFeature: Bool
    @UserDefault("environment", defaultValue: "prod") static var environment: String {
        willSet {
            print("Will Set environment")
        }
        didSet {
            print("Did Set environment")
        }
    }
}

//set to nil again to make sure it does not have values from other playground pages
UserDefaults.standard.setValue(nil, forKey: "environment")
print("Default: \(Settings.environment)")
Settings.environment = "stage"
print("After Set: \(Settings.environment)")
print("User Default Value: \(UserDefaults.standard.string(forKey: "environment") ?? "nil")")


/*
 Results:
 - All functionality regarding UserDefaults is encapsulated in the property wrapper.
 - Property with Property Wrapper identifier can be observed with Will Set and Did Set.
 - The property though can't be used as a computed property.
 */
//: [Next](@next)
