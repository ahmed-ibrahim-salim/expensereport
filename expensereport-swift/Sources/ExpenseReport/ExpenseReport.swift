import Foundation

// switch case
// magic numbers
// primitive obsession

enum ExpenseType {
    case breakfast
    case dinner
    case carRental
}

struct Expense {
    var type: ExpenseType
    var amount: Int
}

class ExpenseReport {
    func doSomethingWithExpenses(_ expense: Expense, _ mealExpenses: inout Int, _ total: inout Int) {
        if expense.type == .dinner || expense.type == .breakfast {
            mealExpenses += expense.amount
        }

        var expenseName = ""
        switch expense.type {
        case .breakfast: expenseName = "Breakfast"
        case .dinner: expenseName = "Dinner"
        case .carRental: expenseName = "Car Rental"
        }

        let mealOverExpensesMarker = expense.type == .dinner && expense.amount > 5000 || expense.type == .breakfast && expense.amount > 1000 ? "X" : " "
        print("\(expenseName)\t\(expense.amount)\t\(mealOverExpensesMarker)")

        total += expense.amount
    }

    func printReport(expenses: [Expense], date: Date = Date()) {
        var mealExpenses = 0
        var total = 0
        print("Expense Report \(date)")
        for expense in expenses {
            doSomethingWithExpenses(expense, &mealExpenses, &total)
        }
        print("Meal Expenses: \(mealExpenses)")
        print("Total Expenses: \(total)")
    }

    func print(_ line: String) {
        Swift.print(line)
    }
}
