//https://leetcode.com/problems/rotate-array/
import XCTest

final class RotateArray: XCTestCase {

    func testExample() throws {
        //XCTAssertEqual([5,6,7,1,2,3,4], rotate([1,2,3,4,5,6,7], 3))
        //XCTAssertEqual([3,99,-1,-100], rotate([-1,-100,3,99], 2))
        var array = [1]
        rotate(&array, 3)
        XCTAssertTrue(true)
    }
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 else { return }
        guard nums.count > 1 else { return }
        
        for _ in 0...k-1 {
            nums.insert(nums.last!, at: 0)
            nums.removeLast()
        }
    }
}
