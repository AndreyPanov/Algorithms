//https://leetcode.com/problems/remove-nth-node-from-end-of-list/

import XCTest

final class RemoveNthNodeFromEndOfList: XCTestCase {

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
        XCTAssertEqual(head, removeNthFromEnd(head, 2)!)
    }
    
    func testExample1() throws {
        let head = ListNode(1)
        XCTAssertEqual(head, removeNthFromEnd(head, 1)!)
    }
    
    func testExample2() throws {
        let head = ListNode(1)
        let node1 = ListNode(2)
        
        head.next = node1
        XCTAssertEqual(head, removeNthFromEnd(head, 2)!)
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard var node = head else { return nil }
        
        var count = 1
        while node.next != nil {
            node = node.next!
            count += 1
        }
        if count == n {
            return head?.next
        }
        node = head!
        var temp = 0
        var prev = node
        while temp < count-n {
            prev = node
            node = node.next!
            temp += 1
        }
        prev.next = node.next
        
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
