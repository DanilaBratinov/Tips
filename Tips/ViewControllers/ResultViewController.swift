import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    var resultNumber: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(resultNumber.rounded())₽"
    }
}
