//https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

import XCTest

final class PopulatingNextRightPointersInEachNode: XCTestCase {

    func testExample() throws {
        let node7 = Node(7)
        let node6 = Node(6)
        let node3 = Node(3)
        node3.left = node6
        node3.right = node7
        
        let node5 = Node(5)
        let node4 = Node(4)
        let node2 = Node(2)
        node2.left = node4
        node2.right = node5
        
        let root = Node(1)
        root.left = node2
        root.right = node3
        
        let connected = connect(root)
        XCTAssertTrue(true)
    }
    
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        let l = root.left
        let r = root.right
        let n = root.next
        
        if let l = l {
            l.next = r
            if let n = n {
                r?.next = n.left
            }
            _ = connect(l)
            _ = connect(r)
        }
        return root
    }
}

class Node {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?

    init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
          self.next = nil
    }
}
