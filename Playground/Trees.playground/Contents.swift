//: Playground - noun: a place where people can play

import UIKit

class Node<T: Comparable> {
    
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

class Tree<T: Comparable> {
    
    var root: Node<T>
    
    init(root: Node<T>) {
        self.root = root
    }
    
    func countNodes(node: Node<T>?) -> Int {
        
        guard let nodeUW = node else { return 0 }
        return countNodes(nodeUW.left) + countNodes(nodeUW.right) + 1
    }
    
    func countLevels(node: Node<T>?) -> Int {
        
        guard let nodeUW = node else { return 0 }
        return max(countLevels(nodeUW.left), countLevels(nodeUW.right)) + 1
    }
    
    var found = false
    func BST_Search(node: Node<T>?, value: T) {
        
        guard let nodeUW = node else { return }
        if found { return }
        
        if nodeUW.value == value {
            found = true
            print(nodeUW)
            return
        }
        if nodeUW.value < value {
            BST_Search(nodeUW.left, value: value)
        } else if nodeUW.value > value {
            BST_Search(nodeUW.right, value: value)
        }
    }
    
    func BST_Insert(node: Node<T>?, value: T) {
        
        guard let nodeUW = node else {
            root = Node(value: value)
            return
        }
        if nodeUW.value == value { return }
        
        if nodeUW.value < value {
            if nodeUW.left != nil {
                BST_Insert(nodeUW.left, value: value)
            } else {
                nodeUW.left = Node(value: value)
            }
        } else if nodeUW.value > value {
            if nodeUW.right != nil {
                BST_Insert(nodeUW.right, value: value)
            } else {
                nodeUW.right = Node(value: value)
            }
        }
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
tree.BST_Search(tree.root, value: 7)

