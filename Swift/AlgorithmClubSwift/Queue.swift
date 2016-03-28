//
//  Queue.swift
//  AlgorithmClubSwift
//
//  Created by Панов Андрей on 28.03.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class Queue<T> {
    
    private var array: [T] = []
    
    func enqueue(value: T) {
        array.append(value)
    }
    
    func dequeue() -> T? {
        
        if let value = array.first {
            array.removeFirst()
            return value
        } else {
            return nil
        }
    }
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}
