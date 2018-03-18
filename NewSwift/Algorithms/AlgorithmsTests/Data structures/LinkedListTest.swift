import XCTest

class LinkedListTest: XCTestCase {
  
  var list: LinkedList<String>!
  
  override func setUp() {
    super.setUp()
    
    list = LinkedList()
    list.head = LinkedList.LinkedListNode(value: "first")
  }
  
  override func tearDown() {
    list = nil
    
    super.tearDown()
  }
  
  func testCount() {
    XCTAssertEqual(list.count, 1)
  }
}
