import Foundation

precedencegroup ExponentiativePrecedence {
  higherThan: MultiplicationPrecedence
  lowerThan: BitwiseShiftPrecedence
  associativity: left
}

infix operator ^^: ExponentiativePrecedence
func ^^(radix: Int, power: Int) -> Double {
  return pow(Double(radix), Double(power))
}

class Karatsuba {
  
  func multiplay(value1: Double, value2: Double) -> Double {
    let num1Array: [Int] = String(value1).components(separatedBy: "").flatMap { return Int($0) }
    let num2Array: [Int] = String(value2).components(separatedBy: "").flatMap { return Int($0) }
    
    guard num1Array.count > 1 && num2Array.count > 1 else {
      return value1 * value2
    }
    
    let n = max(num1Array.count, num2Array.count)
    let nBy2 = n / 2
    
    let a = value1 / 10^^nBy2
    let b = value1.truncatingRemainder(dividingBy: 10^^nBy2)
    let c = value2 / 10^^nBy2
    let d = value2.truncatingRemainder(dividingBy: 10^^nBy2)
    
    let ac = multiplay(value1: a, value2: c)
    let bd = multiplay(value1: b, value2: d)
    let adPlusbc = (a+b)*(c+d) - ac - bd
    
    return ac * 10^^(2 * nBy2) + adPlusbc * 10^^nBy2 + bd
    
  }
}
