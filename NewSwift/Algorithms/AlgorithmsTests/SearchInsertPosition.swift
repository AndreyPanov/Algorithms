//https://leetcode.com/problems/search-insert-position/
import XCTest

final class SearchInsertPosition: XCTestCase {

    func testExample() throws {
        //XCTAssertEqual(2, searchInsert([1,3,5,6], 5))
        //XCTAssertEqual(1, searchInsert([1,3,5,6], 2))
        XCTAssertEqual(4, searchInsert([1,3,5,6], 7))
        
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count-1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid-1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
