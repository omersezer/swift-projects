import UIKit

class Customer {
    let name: String
    weak var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
        print("Customer \(name) initialized")
    }
    
    deinit {
        print("Customer \(name) deinitialized")
    }
}

class CreditCard {
    let creditCardName: String
    var customer: Customer?
    
    init(creditCardName: String) {
        self.creditCardName = creditCardName
        print("CreditCard \(creditCardName) initialized")
    }
    
    deinit {
        print("CreditCard \(creditCardName) deinitialized")
    }
}

var customerOmer: Customer?
var creditCardTest: CreditCard?

customerOmer = Customer(name: "Omer Sezer") // customerOmer's reference count = 1
creditCardTest = CreditCard(creditCardName: "Test Credit Card") // creditCardTest's reference count = 1

customerOmer?.creditCard = creditCardTest // creditCardTest's reference count = 1
creditCardTest?.customer = customerOmer // customerOmer's reference count = 2

creditCardTest = nil // creditCardTest's reference count = 0
customerOmer = nil // customerOmer's reference count = 0
