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
        guard var node = head else { return nil }
        
        var count = 0
        while node.next != nil {
            node = node.next!
            count += 1
        }
        let middle = Int(ceil(Double(count)/2))
        
        var temp = 0
        var midNode = head
        while temp < middle {
            midNode = midNode!.next!
            temp += 1
        }
        return midNode
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
