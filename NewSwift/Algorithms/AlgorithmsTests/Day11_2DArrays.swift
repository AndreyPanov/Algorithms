import XCTest

/*
 1 1 1 0 0 0
 0 1 0 0 0 0
 1 1 1 0 0 0
 0 0 2 4 4 0
 0 0 0 2 0 0
 0 0 1 2 4 0
 */

class Day11_2DArrays: XCTestCase {
  
  func testCalculationPositiveNumbers() {
    let inputLine1 = "1 1 1 0 0 0"
    let inputLine2 = "0 1 0 0 0 0"
    let inputLine3 = "1 1 1 0 0 0"
    let inputLine4 = "0 0 2 4 4 0"
    let inputLine5 = "0 0 0 2 0 0"
    let inputLine6 = "0 0 1 2 4 0"
    let row1 = inputLine1.split(separator: " ").flatMap { Int($0) }
    let row2 = inputLine2.split(separator: " ").flatMap { Int($0) }
    let row3 = inputLine3.split(separator: " ").flatMap { Int($0) }
    let row4 = inputLine4.split(separator: " ").flatMap { Int($0) }
    let row5 = inputLine5.split(separator: " ").flatMap { Int($0) }
    let row6 = inputLine6.split(separator: " ").flatMap { Int($0) }
    let array = [row1, row2, row3, row4, row5, row6]
    
    XCTAssertEqual(19, calculate(array: array))
  }
  
  func testCalculationNegativeNumbers() {
    /*
     -1 -1 0 -9 -2 -2
     -2 -1 -6 -8 -2 -5
     -1 -1 -1 -2 -3 -4
     -1 -9 -2 -4 -4 -5
     -7 -3 -3 -2 -9 -9
     -1 -3 -1 -2 -4 -5
     */
    let inputLine1 = "-1 -1 0 -9 -2 -2"
    let inputLine2 = "-2 -1 -6 -8 -2 -5"
    let inputLine3 = "-1 -1 -1 -2 -3 -4"
    let inputLine4 = "-1 -9 -2 -4 -4 -5"
    let inputLine5 = "-7 -3 -3 -2 -9 -9"
    let inputLine6 = "-1 -3 -1 -2 -4 -5"
    let row1 = inputLine1.split(separator: " ").flatMap { Int($0) }
    let row2 = inputLine2.split(separator: " ").flatMap { Int($0) }
    let row3 = inputLine3.split(separator: " ").flatMap { Int($0) }
    let row4 = inputLine4.split(separator: " ").flatMap { Int($0) }
    let row5 = inputLine5.split(separator: " ").flatMap { Int($0) }
    let row6 = inputLine6.split(separator: " ").flatMap { Int($0) }
    let array = [row1, row2, row3, row4, row5, row6]
    
    XCTAssertEqual(-6, calculate(array: array))
  }
  
  func calculate(array: [[Int]]) -> Int {
    
    var sum = Int.min
    
    var rowLevel = 0
    var columnLevel = 0
    
    while columnLevel+2 < array.count {
      while rowLevel+2 < array.last!.count {
        let subArray = Array(array[columnLevel...columnLevel+2]).map { Array($0[rowLevel...rowLevel+2]) }
        let tmpSum = subCalculation(subArray: subArray)
        if tmpSum > sum {
          sum = tmpSum
        }
        rowLevel += 1
      }
      rowLevel = 0
      columnLevel += 1
    }
    return sum
  }
  
  func subCalculation(subArray: [[Int]]) -> Int {
    //we always know that this matrix 3x3
    /* 2 4 4
         2
       1 2 4 */
    var sum = 0
    for i in subArray {
      for j in i {
        sum = sum + j
      }
    }
    sum = sum - subArray[1][0] - subArray[1][2]
    return sum
  }
}
