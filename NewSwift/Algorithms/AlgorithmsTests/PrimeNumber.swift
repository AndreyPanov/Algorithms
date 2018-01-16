import XCTest

class PrimeNumber: XCTestCase {
  
  func testPrime() {
    XCTAssertEqual([2, 3, 5, 7, 11, 13], findAllPrimes(number: 15))
  }
  
  func testIsPrime() {
    XCTAssertEqual(1, isPrime(41443))
  }
  
  func testIsPrime2() {
    XCTAssertEqual(0, isPrime(39601))
  }
  
  //O(nloglogn)
  func findAllPrimes(number: Int) -> [Int] {
    guard number > 2 else { return [] }
    
    var primesCache: [Bool] = []
    for _ in 0..<number+1 {
      primesCache.append(true)
    }
    primesCache[0] = false
    primesCache[1] = false
    let sqrtNumber = Int(round(sqrt(Double(number))))
    for i in 2..<sqrtNumber {
      if primesCache[i] == true {
        var j = i
        while i*j <= number {
          primesCache[i*j] = false
          j += 1
        }
      }
    }
    var result:[Int] = []
    for i in 0..<primesCache.count {
      if primesCache[i] {
        result.append(i)
      }
    }
    return result
  }
  /*
   for(int i=2; i <= Math.sqrt(n); i++){
     if(prime[i] == 1) {
       for(int j=i; j+i<=n; j+=i) {
         prime[i+j] = 0;
       }
     }
   }﻿
   */
  
  func isPrime(_ number: Int) -> Int {
    guard number > 1 else { return 0 }
    
    var count = 2
    let sqrtNumber = Int(round(sqrt(Double(number))))
    while count <= sqrtNumber {
      if number % count == 0 {
        return 0
      }
      count += 1
    }
    return 1
  }
}
