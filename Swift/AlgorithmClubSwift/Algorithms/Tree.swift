//
//  Tree.swift
//  AlgorithmClubSwift
//
//  Created by Панов Андрей on 14.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class Node<T> {
    
    var value: T
    var left, right: Node?
    
    init(value: T, left: Node? = nil, right: Node? = nil) {
        
        self.value = value
        self.left = left
        self.right = right
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
    func BST_SearchInterative(node: Node<T>?, value: T) {
        guard let nodeUW = node else { return }
        var tmpNode: Node<T>? = nodeUW
        
        while (tmpNode != nil || tmpNode?.value == value) {
            print(tmpNode?.value)
            if value < tmpNode?.value {
                tmpNode = tmpNode?.left
            } else {
                tmpNode = tmpNode?.right
            }
        }
        if tmpNode != nil {
            print(tmpNode!)
        }
    }
    
    func BST_Insert(node: Node<T>?, value: T) {
        
        guard let nodeUW = node else {
            root = Node(value: value)
            return
        }
        if nodeUW.value < value {
            if nodeUW.left != nil {
                BST_Insert(nodeUW.left, value: value)
            } else {
                nodeUW.left = Node(value: value)
            }
        } else if nodeUW.value >= value {
            if nodeUW.right != nil {
                BST_Insert(nodeUW.right, value: value)
            } else {
                nodeUW.right = Node(value: value)
            }
        }
    }
    func inOrderTreeWalk(node: Node<T>?) {
        
        guard let nodeUW = node else { return }
        
        inOrderTreeWalk(nodeUW.left)
        print(nodeUW.value)
        inOrderTreeWalk(nodeUW.right)
    }
    func  inOrderTreeWalkNoRec(node: Node<T>?) {
        guard let nodeUW = node else { return }
        
        let queue = Queue<Node<T>>()
        queue.enqueue(nodeUW)
        while queue.isEmpty() == false {
            
            let root = queue.dequeue()
            print(root!.value)
            if let left = root?.left {
                queue.enqueue(left)
            }
            if let right = root?.right {
                queue.enqueue(right)
            }
        }
    }
}

/*
class TreeNode<T> {
    
    var value: T
    var parent: TreeNode<T>?
    var children = [TreeNode<T>]()
    
    init(value: T) {
        self.value = value
    }
    
    func addChild(node: TreeNode<T>) {
        
        children.append(node)
        node.parent = self
    }
}

extension TreeNode where T: Equatable {
    func search(value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joinWithSeparator(", ") + "}"
        }
        return s
    }
}*/