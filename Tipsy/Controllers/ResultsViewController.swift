import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tip = 0
    var numOfPeople = 2
    var totalPerPerson = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(totalPerPerson)"
        settingsLabel.text = "Split between \(numOfPeople) people, with \(tip)% tip."
    
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
