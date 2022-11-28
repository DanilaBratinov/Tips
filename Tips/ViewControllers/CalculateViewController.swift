
import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet var resultTextField: UITextField!
    @IBOutlet var friendsCountLabel: UILabel!
    @IBOutlet var calculateButtonOutlet: UIButton!
    
    @IBOutlet var procentButtonOutlets: [UIButton]!
    
    var tipNumber = 0.0
    var tipTitle = ""
    
    override func viewDidLoad() {
        setupButton()
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        procentButtonOutlets.forEach { button in
            button.isSelected = false
        }
        
        sender.isSelected = true
        
        tipTitle = sender.currentTitle!
        tipTitle.removeLast()
        
        tipNumber = Double(tipTitle)!
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        friendsCountLabel.text = Int(sender.value).formatted()
    }

    @IBAction func resultButtonPressed() {
        if resultTextField.text != "" && resultTextField.text != nil {
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.resultNumber = Double(resultTextField.text!)! * Double(tipNumber / 100) / Double(friendsCountLabel.text!)!
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        resultTextField.text = ""
        resultTextField.placeholder = "Введите ваш счет"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func setupButton() {
        calculateButtonOutlet.layer.cornerRadius = 10
    }
}
