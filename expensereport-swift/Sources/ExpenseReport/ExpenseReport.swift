import Foundation

// 1- Hard dependency to test --> print to console ---> extract & override with a testable version
// 2- Test will not be F.I.R.S.T ---> not repeatable ---> Date must be injected

// 3- Code smells
// conditional complexity
// shotgun surgery -> adding lunch would need changes in a lot of places
// switch case -> lack of polymorphisim
// magic numbers
// primitive obsession -> lack of

class ExpenseReport {
    func printReport(expenses: [Expense], date: Date = Date()) {
        printReportHeader(date: date)

        expenses.forEach { print($0.getExpenseReport()) }

        printTotals(expenses)
    }

    private func printReportHeader(date: Date) {
        print("Expense Report \(date)")
    }

    private func printTotals(_ expenses: [Expense]) {
        let mealExpenses = expenses.reduce(0) { $0 + $1.getMealAmount() }
        let total = expenses.reduce(0) { $0 + $1.amount }
        print("Meal Expenses: \(mealExpenses)")
        print("Total Expenses: \(total)")
    }

    func print(_ line: String) {
        Swift.print(line)
    }
}
