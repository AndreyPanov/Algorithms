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
        
        //runMergeSort()
        //createLinkedList()
        //boggleGame()
        trees()
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
    
    func boggleGame() {
        
        let game = Booggle(x: 250, y: 250, word: "the")
        game.buildBoard()
        game.startSearch()
    }
    
    func trees() {
        
        let node2 = Node(value: 2)
        let node5_1 = Node(value: 5)
        let node5 = Node(value: 5, left: node2, right: node5_1)
        
        let node8 = Node(value: 8)
        let node7 = Node(value: 7, right: node8)
        
        let root = Node(value: 6, left: node5, right: node7)
        
        let tree = Tree(root: root)
        //tree.countNodes(tree.root)
        //tree.countLevels(tree.root)
        //tree.BST_Search(tree.root, value: 7)
        tree.inOrderTreeWalk(tree.root)
    }
}

