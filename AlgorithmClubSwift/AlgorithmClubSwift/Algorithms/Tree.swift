//
//  Tree.swift
//  AlgorithmClubSwift
//
//  Created by Панов Андрей on 14.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

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
}