//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted

import XCTest

final class TwoSumIIInputArrayIsSorted: XCTestCase {

    func testExample() throws {
        //XCTAssertEqual([1,2], twoSum([2,7,11,15], 9))
        //XCTAssertEqual([1,3], twoSum([2,3,4], 6))
        XCTAssertEqual([1,2], twoSum([-1,0], -1))
        //XCTAssertEqual([2,3], twoSum([5,25,75], 100))
        //XCTAssertEqual([4,5], twoSum([1,2,3,4,4,9,56,90], 8))
    }
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var index1 = 0
        var index2 = numbers.count-1
        
        while index1 < index2 {
            if numbers[index1] + numbers[index2] == target {
                return [index1+1, index2+1]
            }
            if numbers[index1] + numbers[index2] > target {
                index2 -= 1
            } else {
                index1 += 1
            }
        }
        
        return [index1+1, index2+1]
    }
}
