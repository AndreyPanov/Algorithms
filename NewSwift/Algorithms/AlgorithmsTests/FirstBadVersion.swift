// https://leetcode.com/problems/first-bad-version/

import XCTest

final class FirstBadVersion: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(1, firstBadVersion(1))
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        var bad = -1
        while left <= right {
            let mid = (left + right)/2
            if isBadVersion(mid) {
                bad = mid
                left = mid + 1
            } else {
                if bad != -1 {
                    return bad
                }
                right = mid
            }
        }
        return bad
    }
    
    func isBadVersion(_ version: Int) -> Bool{
        return version <= 1
    }
}
