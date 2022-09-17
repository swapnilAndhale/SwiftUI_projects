import UIKit

/*
//Example 1

let json = """
 {
 "name": "Swapnil Andhale",
 "country": "India",
 "use": "To buy a new book",
 "amount": 150
 
 }
 
 """

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    
    do {
        let loan = try decoder.decode(Loan.self, from: jsonData)
        print(loan)
    } catch {
        print(error)
    }
}
*/

/*
//Example 2 - if the name property and the key of json is diffrent


let json = """
 {
 "name": "Swapnil Andhale",
 "country": "India",
 "use": "To buy a new book",
 "loan_amount": 150
 
 }
 
 """

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case use
        case amount = "loan_amount"
    }
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    
    do {
        let loan = try decoder.decode(Loan.self, from: jsonData)
        print(loan)
    } catch {
        print(error)
    }
}

*/



//Example 3 - Nested JSON objects

let json = """
 {
 "name": "Swapnil Andhale",
 "location" : {
    "country": "India",
 },
 "use": "To buy a new book",
 "loan_amount": 150
 
 }
 
 """
struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        name = try value.decode(String.self, forKey: .name)
        let location = try value.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        country = try location.decode(String.self, forKey: .country)
        use = try value.decode(String.self, forKey: .use)
        amount = try value.decode(Int.self, forKey: .amount)
    }
}
let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    
    do {
        let loan = try decoder.decode(Loan.self, from: jsonData)
        print(loan)
    } catch {
        print(error)
    }
}



//Example 4 - JSON on Array

/*

let json = """
{
"loans":
[{
"name": "John Davis",
"location": {
"country": "Paraguay",
},
"use": "to buy a new collection of clothes to stock her shop before the holidays." ,
"loan_amount": 150
},
{
"name": "Las Margaritas Group",
"location": {
"country": "Colombia",
},
"use": "to purchase coal in large quantities for resale.",
"loan_amount": 200
}]
}
"""

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        name = try value.decode(String.self, forKey: .name)
        let location = try value.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        country = try location.decode(String.self, forKey: .country)
        use = try value.decode(String.self, forKey: .use)
        amount = try value.decode(Int.self, forKey: .amount)
    }
}


struct LoanStore: Codable {
    var loans: [Loan]
}
let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    
    do {
        let loanStore = try decoder.decode(LoanStore.self, from: jsonData)
        for loan in loanStore.loans {
            print(loan)
        }
    } catch {
        print(error)
    }
}

*/
