//https://leetcode.com/problems/squares-of-a-sorted-array/
import XCTest

final class SquaresOfSortedArray: XCTestCase {

    func testExample() throws {
        //XCTAssertEqual([0,1,9,16,100], sortedSquares([-4,-1,0,3,10]))
        XCTAssertEqual([4,9,9,49,121], sortedSquares([-7,-3,2,3,11]))
    }
    
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map { n in n*n }.sorted()
    }
}
