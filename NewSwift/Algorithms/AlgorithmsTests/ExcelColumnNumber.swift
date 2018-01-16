import XCTest

class ExcelColumnNumber: XCTestCase {
  
  func testColumn() {
    XCTAssertEqual(27, titleToNumber("AA"))
  }
  
  func testNumber() {
    print(numberToTitle(703))
    XCTAssertEqual("AAA", numberToTitle(703))
  }
  
  func testNumber1() {
    print(numberToTitle(943566))
    XCTAssertEqual("BAQTZ", numberToTitle(943566))
  }
  
  func titleToNumber(_ column: String) -> Int {
    guard column.isEmpty == false else { return 0 }
    
    var result = 0
    let reverseColumn: [Character] = column.reversed()
    for index in 0..<Int(column.count) {
      result += number(by: reverseColumn[index])*Int(truncating: NSDecimalNumber(decimal: pow(Decimal(26), index)))
    }
    return result
  }
  
  func numberToTitle(_ number: Int) -> String {
    guard number != 0 else { return "" }
    guard number > 26 else { return letter(by: number) }
    
    var result = ""
    var tmp = number
    while tmp > 26 {
      if tmp % 26 == 0 {
        result += "Z"
        tmp -= 26
      } else {
        result += letter(by: tmp % 26)
        tmp -= tmp % 26
      }
      tmp = tmp/26
    }
    result += letter(by: tmp)
    return String(result.reversed())
  }
  
  private func number(by letter: Character) -> Int {
    switch letter {
      case "A": return 1
      case "B": return 2
      case "C": return 3
      case "D": return 4
      case "E": return 5
      case "F": return 6
      case "G": return 7
      case "H": return 8
      case "I": return 9
      case "J": return 10
      case "K": return 11
      case "L": return 12
      case "M": return 13
      case "N": return 14
      case "O": return 15
      case "P": return 16
      case "Q": return 17
      case "R": return 18
      case "S": return 19
      case "T": return 20
      case "U": return 21
      case "V": return 22
      case "W": return 23
      case "X": return 24
      case "Y": return 25
      case "Z": return 26
      default: return 0
    }
  }
  
  private func letter(by number: Int) -> String {
    switch number {
    case 1: return "A"
    case 2: return "B"
    case 3: return "C"
    case 4: return "D"
    case 5: return "E"
    case 6: return "F"
    case 7: return "G"
    case 8: return "H"
    case 9: return "I"
    case 10: return "J"
    case 11: return "K"
    case 12: return "L"
    case 13: return "M"
    case 14: return "N"
    case 15: return "O"
    case 16: return "P"
    case 17: return "Q"
    case 18: return "R"
    case 19: return "S"
    case 20: return "T"
    case 21: return "U"
    case 22: return "V"
    case 23: return "W"
    case 24: return "X"
    case 25: return "Y"
    case 26: return "Z"
    default: return ""
    }
  }
}

extension String {
  
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
}
