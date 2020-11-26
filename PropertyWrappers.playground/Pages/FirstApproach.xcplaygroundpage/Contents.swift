//: [Previous](@previous)

import Foundation

@propertyWrapper
struct UserDefault {
    var wrappedValue: String = "Hello"
}

struct Settings {
    @UserDefault() static var environment: String
}

//set to nil again to make sure it does not have values from other playground pages
UserDefaults.standard.setValue(nil, forKey: "environment")
print("Default: \(Settings.environment)")
Settings.environment = "stage"
print("After Set: \(Settings.environment)")
print("User Default Value: \(UserDefaults.standard.string(forKey: "environment") ?? "nil")")

/*:
Information from the proposal:
There are property implementation patterns that come up repeatedly. Rather than hardcode a fixed set of patterns into the compiler (as we have done for lazy and @NSCopying), we should provide a general "property wrapper" mechanism to allow these patterns to be defined as libraries.

 Minimum requirements for creation:
 - Use @propertyWrapper before struct or class
 - Declare non static wrappedValue var in struct or class

 Property wrapper formula for property declaration:
 
 Property Wrapper Identifier + Optional static identifier + Constant/Variable + name + type

 */
//: [Next](@next)
