import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let array = [0, 6, 78, 4, 7, 23, 56, 6]
    let sortModule = MergeSort()
    print(sortModule.sort(array: array))
  }
}

