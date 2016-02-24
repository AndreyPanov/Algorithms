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
            while case let next? = node.next {
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
}