//https://leetcode.com/problems/longest-substring-without-repeating-characters/

import XCTest

final class LongestSubstringWithoutRepeatingCharacters: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(3, lengthOfLongestSubstring("abcabcbb"))
        XCTAssertEqual(1, lengthOfLongestSubstring("bbbb"))
        XCTAssertEqual(3, lengthOfLongestSubstring("pwwkew"))
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        return 0
    }
}
