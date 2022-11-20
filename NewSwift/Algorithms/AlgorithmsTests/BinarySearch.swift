//https://leetcode.com/problems/binary-search
import XCTest

final class BinarySearch: XCTestCase {


    func testExample() throws {
        XCTAssertEqual(4, search([-1,0,3,5,9,12], 9))
        //XCTAssertEqual(-1, search([-1,0,3,5,9,12], 2))
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
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
        
        return -1
    }

}
