//

import XCTest

final class MiddleofTheLinkedList: XCTestCase {

    func testExample() throws {
        let head = ListNode(1)
        let node1 = ListNode(2)
        let node2 = ListNode(3)
        let node3 = ListNode(4)
        let node4 = ListNode(5)
        
        head.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        XCTAssertEqual(node2, middleNode(head)!)
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        return head
    }
    
    public class ListNode: Equatable {
        public var val: Int
        public var next: ListNode?
        public init() {
            self.val = 0
            self.next = nil
        }
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        public init(_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
        
        public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
            return lhs === rhs
        }
      }
}
