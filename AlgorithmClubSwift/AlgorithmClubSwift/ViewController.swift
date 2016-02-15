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
    }
    
    func runMergeSort() {
        
        let unsortedArray = [3, 56, 67, 5, 12, 55]
        
        print(mergeSort(unsortedArray))
    }

}

