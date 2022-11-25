//https://leetcode.com/problems/reverse-string/

import XCTest

final class ReverseString: XCTestCase {

    func testExample() throws {
        var s = [Character("h"), Character("e"), Character("l"), Character("l"), Character("o")]
        reverseString(&s)
        XCTAssertEqual([Character("o"), Character("l"), Character("l"), Character("e"), Character("h")], s)
    }
    
    func reverseString(_ s: inout [Character]) {
        var right = s.count-1
        var left = 0
        while right > left {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
            right -= 1
            left += 1
        }
    }
}

