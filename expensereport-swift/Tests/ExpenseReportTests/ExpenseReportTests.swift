@testable import ExpenseReport
import XCTest

final class ExpenseReportTests: XCTestCase {
    func testPrintReport() throws {
        let date = makeDate(year: 1, month: 1, day: 1, hour: 1, minute: 1, second: 1)
        let expenses = [
            Expense(type: .breakfast, amount: 100),
            Expense(type: .breakfast, amount: 100_000),
            Expense(type: .carRental, amount: 5000),
            Expense(type: .carRental, amount: 5_000_000),
            Expense(type: .dinner, amount: 100),
            Expense(type: .dinner, amount: 5_000_000),
        ]
        let expensesReport = TestableExpenseReport()
        expensesReport.printReport(expenses: expenses, date: date)

        let output = """
        Expense Report 2002-02-01 17:31:01 +0000
        Breakfast	100	 
        Breakfast	100000	X
        Car Rental	5000	 
        Car Rental	5000000	 
        Dinner	100	 
        Dinner	5000000	X
        Meal Expenses: 5100200
        Total Expenses: 10105200
        """

        XCTAssertEqual(output, expensesReport.getLinesAsString())
    }
}

extension ExpenseReportTests {
    func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date { Date(timeIntervalSinceReferenceDate: TimeInterval(year * 31_557_600 + month * 2_629_800 + day * 86400 + hour * 3600 + minute * 60 + second))
    }
}

class TestableExpenseReport: ExpenseReport {
    private var lines: [String] = []
    override func print(_ line: String) {
        lines.append(line)
    }

    func getLinesAsString() -> String {
        lines.joined(separator: "\n")
    }
}
