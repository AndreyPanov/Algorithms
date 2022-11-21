// https://leetcode.com/problems/first-bad-version/

import XCTest

final class FirstBadVersion: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(1702766719, firstBadVersion(2126753390))
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            let mid = (left + right)/2
            if isBadVersion(mid) {
                right = mid-1
            } else {
                left = mid+1
            }
        }
        return left
    }
    
    func isBadVersion(_ version: Int) -> Bool{
        return version >= 1702766719
    }
}
