import XCTest

class FindMaxSubArray: XCTestCase {
  
  let array = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7, 13, -3, -25, -16, -23, -16]
  
  func testArray() {
    
    XCTAssertEqual(47, findMaxSum(with: array))
  }
  
  func testArrayBruteForce() {
    XCTAssertEqual(47, bruteForce(with: array).sum)
  }
  
  func findMaxSum(with array: [Int]) -> Int {
    return findMaxSubArray(with: array, low: 0, high: array.count-1).sum
  }
  
  func findMaxSubArray(with array: [Int], low: Int, high: Int) -> (low: Int, high: Int, sum: Int) {
    guard high != low else { return (low, high, array[low]) }
    guard array.count > 393 else { return bruteForce(with: array) }
    
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
    return (maxLeft, maxRight, (leftSum == Int.min || rightSum == Int.min) ? Int.min : leftSum+rightSum)
  }
  
  func bruteForce(with array: [Int]) -> (low: Int, high: Int, sum: Int) {
    var maxSum = Int.min
    var low = 0
    var high = 0
    var i = 0
    while i < array.count {
      var j = i
      var sum = 0
      while j < array.count {
        sum = sum + array[j]
        if sum > maxSum {
          maxSum = sum
          low = i
          high = j
        }
        j += 1
      }
      i += 1
    }
    return (low, high, maxSum)
  }
}
