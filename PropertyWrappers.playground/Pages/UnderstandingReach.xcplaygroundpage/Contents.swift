//: [Previous](@previous)

import Foundation

@propertyWrapper
struct UserDefault {
    var wrappedValue: String

    init(_ initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Settings {
    @UserDefault("dev") static var environment: String
}

//set to nil again to make sure it does not have values from other playground pages
UserDefaults.standard.setValue(nil, forKey: "environment")
print("Default: \(Settings.environment)")
Settings.environment = "stage"
print("After Set: \(Settings.environment)")
print("User Default Value: \(UserDefaults.standard.string(forKey: "environment") ?? "nil")")

/*
 By using propertyWrapper we obtain 2 things:
 - To have the ability to provide additional parameters to a property
 - To control set and get properties with initial parameters and custom logic.
 */
//: [Next](@next)
