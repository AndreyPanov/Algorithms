import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    /*let array = [0, 6, 78, 4, 7, 23, 56, 6]
    let sortModule = MergeSort()
    print(sortModule.sort(array: array))
    
    let num1: Double = 234234234
    let num2: Double = 234
    let karatsuba = Karatsuba()
    print(karatsuba.multiplay(value1: num1, value2: num2))
    */
    let array1 = [10, 6, 78, 4, 7, 23, 56, 60]
    //let sortInsertModule = InsertSort()
    //print(sortInsertModule.sort(array: array1))
    let inversion = CountInversion()
    print(inversion.inversion(array: array1) ?? "no pairs")
    
  }
}

