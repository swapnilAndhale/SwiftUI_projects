import UIKit

let json = """
{
"name": "Swapnil Andhale",
"country": "India",
"use": "To buy new book",
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
