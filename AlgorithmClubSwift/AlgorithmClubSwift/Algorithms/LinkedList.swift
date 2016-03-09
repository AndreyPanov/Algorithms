//
//  LinkedList.swift
//  AlgorithmClubSwift
//
//  Created by Панов Андрей on 24.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

class LinkedListNode<T> {
    
    var value: T
    var next: LinkedListNode?
    var previous: LinkedListNode?
    
    init (value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    
    typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    var first: Node? {
        return head
    }
    
    var last: Node? {
        
        if var node = head {
            while let next = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }
    
    var count: Int {
        
        if var node = head {
            
            var c = 1
            while let next = node.next {
                node = next
                c = c.successor()
            }
            return c
        } else {
            return 0
        }
    }
    
    func append(value: T) {
        
        let node = Node(value: value)
        if let lastUnwrapped = last {
            node.previous = lastUnwrapped
            node.next = nil
            lastUnwrapped.next = node
        } else {
            head = node
        }
    }
    
    func nodeAtIndex(index: Int) -> Node? {
        
        guard index > 0 else { return first }
        
        var j = 0
        var node = head
        while let next = node?.next {
            node = next
            j = j.successor()
            if j == index {
                return node
            }
        }
        return nil
    }
    
    subscript(i: Int) -> T? {
        return nodeAtIndex(i)?.value
    }
    
    func removeNode(node: Node) {
        
        let next = node.next
        let prev = node.previous
        
        if let prevUn = prev {
            prevUn.next = next
        } else {
            head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
    }
    
    func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        
        assert(index >= 0)
        
        var i = index
        var next = head
        var prev: Node?
        
        while i > 0 && next != nil {
            
            i = i.predecessor()
            prev = next
            if let nextNext = next?.next {
                next = nextNext
            } else {
                return (nil, nil)
            }
        }
        
        assert(i == 0)
        
        return (prev, next)
    }
}