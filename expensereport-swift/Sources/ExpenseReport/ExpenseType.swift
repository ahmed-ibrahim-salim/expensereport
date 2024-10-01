import Foundation

protocol ExpenseTypeInterface {
    var maxAmount: Int { get }
    var title: String { get }
    func isMealOverMaxAmount(_ amount: Int) -> Bool
    func getMealAmount(_ amount: Int) -> Int
}

extension ExpenseTypeInterface {
    func isMealOverMaxAmount(_ amount: Int) -> Bool { amount > maxAmount }
    func getMealAmount(_ amount: Int) -> Int { amount }
}

struct Breakfast: ExpenseTypeInterface {
    let title: String = "Breakfast"
    var maxAmount: Int

    init(maxAmount: Int = 1000) {
        self.maxAmount = maxAmount
    }
}

struct Lunch: ExpenseTypeInterface {
    let title: String = "Lunch"
    var maxAmount: Int

    init(maxAmount: Int = 2000) {
        self.maxAmount = maxAmount
    }
}

struct Dinner: ExpenseTypeInterface {
    let title: String = "Dinner"
    var maxAmount: Int

    init(maxAmount: Int = 5000) {
        self.maxAmount = maxAmount
    }
}

struct CarRental: ExpenseTypeInterface {
    let title: String = "Car Rental"
    var maxAmount: Int

    init(maxAmount: Int = 50000) {
        self.maxAmount = maxAmount
    }

    func getMealAmount(_: Int) -> Int { 0 }
}

struct FlightTicket: ExpenseTypeInterface {
    let title: String = "Flight Ticket"
    var maxAmount: Int

    init(maxAmount: Int = 70000) {
        self.maxAmount = maxAmount
    }

    func getMealAmount(_: Int) -> Int { 0 }
}
