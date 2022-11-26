//https://leetcode.com/problems/reverse-words-in-a-string-iii/

import XCTest

final class ReverseWordsinStringIII: XCTestCase {

    func testExample() throws {
        XCTAssertEqual("s'teL ekat edoCteeL tsetnoc", reverseWords("Let's take LeetCode contest"))
    }
    
    func reverseWords(_ s: String) -> String {
        return s.components(separatedBy: " ").map { String($0.reversed()) }.joined(separator: " ")
    }
    
    private func reverseString(_ s: String) -> String {
        var s = Array(s)
        var right = s.count-1
        var left = 0
        while right > left {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
            right -= 1
            left += 1
        }
        return String(s)
    }
}
