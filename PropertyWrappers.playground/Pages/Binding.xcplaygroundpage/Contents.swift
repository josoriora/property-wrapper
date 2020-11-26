//: [Previous](@previous)

import Foundation
import SwiftUI

struct MyExample {
    @State static var str = "Hello, playground"
    
    static func printStruct() {
        print(MyExample.str)
        print(MyExample._str)
        print(MyExample.$str)
    }
}

MyExample.printStruct()

//: [Next](@next)
