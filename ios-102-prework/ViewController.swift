
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var petsLabel: UILabel!
    @IBOutlet weak var morePetsLabel: UILabel!
    @IBOutlet weak var introduceButton: UIButton!
    @IBOutlet weak var changeBackgroundButton: UIButton!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    
    @IBOutlet weak var numberOfPets: UILabel!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    
    @IBAction func introduceButtonTapped(_ sender: UIButton) {
        
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPets.text!) pets. It is \(morePetsSwitch.isOn) that I want more pets"
                
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func updateNumberOfPets(_ sender: UIStepper) {
        
        numberOfPets.text = Int(sender.value).description
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        
        let randomColor = getRandomColor()
        view.backgroundColor = randomColor
        
        let textColor = isLightColor(randomColor) ? UIColor.darkText : UIColor.white
        firstNameLabel.textColor = textColor
        lastNameLabel.textColor = textColor
        schoolNameLabel.textColor = textColor
        petsLabel.textColor = textColor
        numberOfPets.textColor = textColor
        morePetsLabel.textColor = textColor
        introduceButton.setTitleColor(textColor, for: .normal)
        changeBackgroundButton.setTitleColor(textColor, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getRandomColor() -> UIColor {
        
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    func isLightColor(_ color: UIColor) -> Bool {
        
            var white: CGFloat = 0.0
            color.getWhite(&white, alpha: nil)
            return white > 0.5
        }

}

