import XCTest

class FindMaxSubArray: XCTestCase {
  
  func testArray() {
    let array = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
    
    XCTAssertEqual(43, findMaxSum(with: array))
  }
  
  func findMaxSum(with array: [Int]) -> Int {
    let (_, _, sum) = findMaxSubArray(with: array, low: 0, high: array.count-1)
    return sum
  }
  
  func findMaxSubArray(with array: [Int], low: Int, high: Int) -> (low: Int, high: Int, sum: Int) {
    guard high == low else { return (low, high, array[low]) }
    
    let mid = (low + high)/2
    let (leftLow, leftHigh, leftSum) = findMaxSubArray(with: array, low: low, high: mid)
    let (rightLow, rightHigh, rightSum) = findMaxSubArray(with: array, low: mid+1, high: high)
    let (crossLow, crossHigh, crossSum) = findMaxCrossingSubArray(array: array, low: low, mid: mid, high: high)
    if leftSum >= rightSum && leftSum >= crossSum {
      return (leftLow, leftHigh, leftSum)
    } else if rightSum >= leftSum && rightSum >= crossSum {
      return (rightLow, rightHigh, rightSum)
    } else {
      return (crossLow, crossHigh, crossSum)
    }
  }
  
  func findMaxCrossingSubArray(array: [Int], low: Int, mid: Int, high: Int) -> (maxLeft: Int, maxRight: Int, sum: Int) {
    
    var leftSum = Int.min
    var maxLeft = 0
    var sum = 0
    var i = mid
    while i > low {
      sum = sum + array[i]
      if sum > leftSum {
        leftSum = sum
        maxLeft = i
      }
      i -= 1
    }
    
    var rightSum = Int.min
    var maxRight = 0
    sum = 0
    var j = mid + 1
    while j < high {
      sum = sum + array[j]
      if sum > rightSum {
        rightSum = sum
        maxRight = j
      }
      j += 1
    }
    return (maxLeft, maxRight, leftSum+rightSum)
  }
}
