//https://leetcode.com/problems/reverse-string/

import XCTest

final class ReverseString: XCTestCase {

    func testExample() throws {
        var s = [Character("h"), Character("e"), Character("l"), Character("l"), Character("o")]
        reverseString(&s)
        XCTAssertEqual([Character("o"), Character("l"), Character("l"), Character("e"), Character("h")], s)
    }
    
    func reverseString(_ s: inout [Character]) {
        
    }
}
