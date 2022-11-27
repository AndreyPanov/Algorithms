//https://leetcode.com/problems/permutation-in-string/

import XCTest

final class PermutationInString: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(true, checkInclusion("ab", "eidbaooo"))
        XCTAssertEqual(false, checkInclusion("ab", "eidboaoo"))
    }
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        return true
    }
}
