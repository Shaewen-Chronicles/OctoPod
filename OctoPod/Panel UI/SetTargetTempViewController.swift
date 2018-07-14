import UIKit

class SetTargetTempViewController: UITableViewController {
    
    enum TargetScope {
        case bed
        case tool0
        case tool1
    }

    @IBOutlet weak var targetTempField: UITextField!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var targetTempScope: SetTargetTempViewController.TargetScope?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch targetTempScope! {
        case .bed:
            button1.setTitle("60", for: .normal)
            button2.setTitle("80", for: .normal)
        default:
            button1.setTitle("210", for: .normal)
            button2.setTitle("235", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tempChanged(_ sender: Any) {
        if let text = targetTempField.text, let newTemp: Int = Int(text) {
            if targetTempScope! == .bed {
                setButton.isEnabled = newTemp >= 0 && newTemp < 150
            } else {
                setButton.isEnabled = newTemp >= 0 && newTemp < 500
            }
        } else {
            setButton.isEnabled = false
        }
    }
    
    
    @IBAction func setOff(_ sender: Any) {
        targetTempField.text = "0"
        setTargetTemp(sender)
    }
    
    @IBAction func setButton1Temp(_ sender: Any) {
        targetTempField.text = button1.titleLabel?.text
        setTargetTemp(sender)
    }
    
    @IBAction func setButton2Temp(_ sender: Any) {
        targetTempField.text = button2.titleLabel?.text
        setTargetTemp(sender)
    }
    
    @IBAction func setTargetTemp(_ sender: Any) {
        performSegue(withIdentifier: "backFromSetTemperature", sender: self)
    }
}
