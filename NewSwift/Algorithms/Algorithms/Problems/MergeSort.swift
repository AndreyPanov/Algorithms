import Foundation

//345662
//345 662

class MergeSort {
  
  func sort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middle = array.count/2
    let left = sort(array: Array(array[0..<middle]))
    let right = sort(array: Array(array[middle..<array.count]))
    return merge(left: left, right: right)
  }
  
  private func merge(left: [Int], right: [Int]) -> [Int] {
    
    var leftCount = 0
    var rightCount = 0
    var result = [Int]()
    
    while leftCount < left.count && rightCount < right.count {
      if left[leftCount] > right[rightCount] {
        result.append(right[rightCount])
        rightCount += 1
      } else if left[leftCount] < right[rightCount] {
        result.append(left[leftCount])
        leftCount += 1
      } else {
        result.append(right[rightCount])
        rightCount += 1
        result.append(left[leftCount])
        leftCount += 1
      }
    }
    
    while leftCount < left.count {
      result.append(left[leftCount])
      leftCount += 1
    }
    while rightCount < right.count {
      result.append(right[rightCount])
      rightCount += 1
    }
    return result
  }
}
