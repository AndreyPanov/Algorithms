//
//  ViewController.swift
//  AlgorithmClubSwift
//
//  Created by Панов Андрей on 15.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        runMergeSort()
        createLinkedList()
    }
    
    func runMergeSort() {
        
        let unsortedArray = [3, 56, 67, 5, 12, 55]
        
        print(mergeSort(unsortedArray))
    }

    func createLinkedList() {
        
        let linkedList = LinkedList<String>()
        print(linkedList.first)
        print(linkedList.isEmpty)
        
        linkedList.append("Cat1")
        linkedList.append("Cat2")
        linkedList.append("Cat3")
        linkedList.append("Cat4")
        linkedList.append("Cat5")
        linkedList.append("Cat6")
        linkedList.nodesBeforeAndAfter(15)
        print(linkedList.first!.value)
        print(linkedList.isEmpty)
        print(linkedList.count)
        print(linkedList.nodeAtIndex(3)?.value)
        
        print(linkedList[2])
    }
}

