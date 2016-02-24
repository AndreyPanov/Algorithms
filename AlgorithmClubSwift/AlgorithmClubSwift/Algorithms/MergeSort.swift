//
//  File.swift
//  AlgorithmClubSwift
//
//  Created by Панов Андрей on 15.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

func mergeSort(unsortedArray: [Int]) -> [Int] {
    
    guard unsortedArray.count > 1 else { return unsortedArray }
    
    let midIndex = unsortedArray.count / 2
    let leftPile = mergeSort(Array(unsortedArray[0..<midIndex]))
    let rightPile = mergeSort(Array(unsortedArray[midIndex..<unsortedArray.count]))
    
    return mergeSortWithLeftPile(leftPile, rightPile: rightPile)
}

private func mergeSortWithLeftPile(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    var array: [Int] = []
    
    while (leftIndex < leftPile.count && rightIndex < rightPile.count) {
        
        if (leftPile[leftIndex] < rightPile[rightIndex]) {
            
            array.append(leftPile[leftIndex])
            leftIndex++
        }
        else if (leftPile[leftIndex] > rightPile[rightIndex]) {
            
            array.append(rightPile[rightIndex])
            rightIndex++
        }
        else {
    
            array.append(leftPile[leftIndex])
            leftIndex++
            array.append(rightPile[rightIndex])
            rightIndex++
        }
    }
    
    while (leftIndex < leftPile.count) {
        
        array.append(leftPile[leftIndex])
        leftIndex++
    }
    while (rightIndex < rightPile.count) {
        
        array.append(rightPile[rightIndex])
        rightIndex++
    }
    return array
}