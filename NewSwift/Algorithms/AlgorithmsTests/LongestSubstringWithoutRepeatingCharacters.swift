//https://leetcode.com/problems/longest-substring-without-repeating-characters/

import XCTest

final class LongestSubstringWithoutRepeatingCharacters: XCTestCase {

    func testExample() throws {
        //XCTAssertEqual(3, lengthOfLongestSubstring("abcabcbb"))
        //XCTAssertEqual(1, lengthOfLongestSubstring("bbbb"))
        //XCTAssertEqual(3, lengthOfLongestSubstring("pwwkew"))
        XCTAssertEqual(1, lengthOfLongestSubstring(" "))
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var maxLength = 0
        var currentLength = 0
        var storage = Set<Character>()
        for i in 0..<s.count {
            for j in i..<s.count {
                currentLength = storage.count
                storage.insert(s[j])
                if storage.count > currentLength {
                    currentLength = storage.count
                } else {
                    maxLength = max(maxLength, currentLength)
                    storage.removeAll()
                    break
                }
            }
        }
        return max(maxLength, currentLength)
    }
}
