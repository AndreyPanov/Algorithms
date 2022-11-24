//https://leetcode.com/problems/move-zeroes
import XCTest

final class MoveZeroes: XCTestCase {

    func testExample() throws {
        var array = [0,1,0,3,12]
        moveZeroes(&array)
        XCTAssertTrue(true)
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count>1 else { return }
            
        var fast = 0
        var slow = 0
        
        while (fast < nums.count) {
            if (nums[fast] != 0) {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        for i in slow..<fast {
            nums[i] = 0
        }
    }
}
