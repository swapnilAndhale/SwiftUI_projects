import Cocoa

//ARC - Autometic Reference counting
//properties - Stored , computed properties
class Student {
    var num = 10 // stored property
    var temp = 45
    let name: String
    
    //Initialization
    init(num: Int, temp: Int, name: String) {
        self.num = num
        self.temp = temp
        self.name = name
    }
}



class User {
    let name: String?
    
    init(name: String) {    // e.g. 8 bit
        self.name = name
        print("In Init and what is \(name)")
    }
    
    deinit {
        // // memory free //
        print("In deinit and what is \(name)")
    }
    
    
}

//let user = User(name: "Ravi") // 1 // heap

func gun() {  // Stack
    let user = User(name: "Ravi")
    var name: User?
}

gun()
