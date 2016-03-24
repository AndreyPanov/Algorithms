//: Playground - noun: a place where people can play

import UIKit

class Node<T> {
    
    var value: T
    var left, right: Node?
    
    convenience init(value: T, left: Node?, right: Node?) {
        
        self.init(value: value)
        self.left = left
        self.right = right
    }
    
    init(value: T) {
        self.value = value
    }
}

class Tree {
    
    var root: Node<Int>
    
    init(root: Node<Int>) {
        self.root = root
    }
    
    func countNodes(node: Node<Int>?) -> Int {
        
        guard let nodeUnwrapped = node else { return 0 }
        return countNodes(nodeUnwrapped.left) + countNodes(nodeUnwrapped.right) + 1
    }
    
    func countLevels(node: Node<Int>?) -> Int {
        
        guard let nodeUnwrapped = node else { return 0 }
        return max(countLevels(nodeUnwrapped.left), countLevels(nodeUnwrapped.right)) + 1
    }
}

let node5 = Node(value: 5)
let node6 = Node(value: 6)
let node4 = Node(value: 4, left: node5, right: node6)
let node3 = Node(value: 3)
let node1 = Node(value: 1, left: node3, right: node4)

let node7 = Node(value: 7)
let node2 = Node(value: 2, left: node7, right: nil)

let node0 = Node(value: 0, left: node1, right: node2)

let tree = Tree(root: node0)
tree.countNodes(tree.root)
tree.countLevels(tree.root)

