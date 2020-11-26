//: [Previous](@previous)

import Foundation

/**:
 Projections:

 A property wrapper type can choose to provide a projection property (e.g., $foo) to expose more API for each wrapped property by defining a projectedValue property.
 As with the wrappedValue property and init(wrappedValue:), the projectedValue property must have the same access level as its property wrapper type. For example
*/

@propertyWrapper
public struct UserDefault<T> {
    let key: String
    let defaultValue: T

    public var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        UserDefaults.standard.register(defaults: [key: defaultValue])
    }

    public var projectedValue: Self {
        get { self }
        set { self = newValue }
    }
}

public struct Settings {
    @UserDefault("awesomeFeature", defaultValue: false) public static var newAwesomeFeature: Bool
    @UserDefault("environment", defaultValue: "prod") public static var environment: String
}

//set to nil again because it won't work properly after second run
UserDefaults.standard.setValue(nil, forKey: "environment")
print("Default: \(Settings.environment)")
Settings.environment = "stage"
print("After Set: \(Settings.environment)")
print("User Default Value: \(UserDefaults.standard.string(forKey: "environment") ?? "nil")")
print("-----------------------------------------------------------------")
print("key :\(Settings.$environment)")
//print("default value: \(Settings.$environment.defaultValue)")
//print("wrapped value: \(Settings.$environment.wrappedValue)")

/**:
 -You can project the whole property in itself or you can just project specific parts.
 */


//: [Next](@next)
