import Foundation

struct Expense {
    private var type: ExpenseTypeInterface
    var amount: Int

    init(_ type: ExpenseTypeInterface, amount: Int) {
        self.amount = amount
        self.type = type
    }

    func getExpenseReport() -> String {
        let mealOverExpensesMarker = type.isMealOverMaxAmount(amount) ? "X" : " "
        return "\(type.title)\t\(amount)\t\(mealOverExpensesMarker)"
    }

    func getMealAmount() -> Int { type.getMealAmount(amount) }
}
