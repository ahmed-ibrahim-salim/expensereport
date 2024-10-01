@testable import ExpenseReport
import XCTest

final class ExpenseReportTests: XCTestCase {
    func testPrintReport() throws {
        let date = makeDate(year: 1, month: 1, day: 1, hour: 1, minute: 1, second: 1)
        let expenses: [Expense] = [
            Expense(Breakfast(), amount: 100),
            Expense(Breakfast(), amount: 10000),
            Expense(Lunch(), amount: 1000),
            Expense(Lunch(), amount: 10000),
            Expense(Dinner(), amount: 100),
            Expense(Dinner(), amount: 10000),
            Expense(CarRental(), amount: 5000),
            Expense(CarRental(), amount: 60000),
            Expense(FlightTicket(), amount: 50000),
            Expense(FlightTicket(), amount: 80000),
        ]
        let expensesReport = TestableExpenseReport()
        expensesReport.printReport(expenses: expenses, date: date)

        let output = """
        Expense Report 2002-02-01 17:31:01 +0000
        Breakfast	100	 
        Breakfast	10000	X
        Lunch	1000	 
        Lunch	10000	X
        Dinner	100	 
        Dinner	10000	X
        Car Rental	5000	 
        Car Rental	60000	X
        Flight Ticket	50000	 
        Flight Ticket	80000	X
        Meal Expenses: 31200
        Total Expenses: 226200
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
