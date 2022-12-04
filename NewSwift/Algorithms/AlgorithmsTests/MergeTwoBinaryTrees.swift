//https://leetcode.com/problems/merge-two-binary-trees/

import XCTest

final class MergeTwoBinaryTrees: XCTestCase {

    func testExample() throws {
        
        let node5 = TreeNode(5)
        let node3 = TreeNode(3, node5, nil)
        let node2 = TreeNode(2)
        let root1 = TreeNode(1, node3, node2)
        
        let node4 = TreeNode(4)
        let node1 = TreeNode(1, nil, node4)
        let node7 = TreeNode(7)
        let node33 = TreeNode(3, nil, node7)
        let root2 = TreeNode(2, node1, node33)
        
        let mergedTree = mergeTrees(root1, root2)
        XCTAssertTrue(true)
    }
    
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        root1.val += root2.val
        root1.left = mergeTrees(root1.left, root2.left)
        root1.right = mergeTrees(root1.right, root2.right)
        return root1
    }

}

class TreeNode {
      var val: Int
      var left: TreeNode?
      var right: TreeNode?
    
      init() {
          self.val = 0
          self.left = nil
          self.right = nil
      }
    
      init(_ val: Int) {
          self.val = val;
          self.left = nil;
          self.right = nil;
      }
    
      init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
