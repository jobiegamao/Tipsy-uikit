import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var splitNumber: Int = 2
    var splitPercent: Double = 0.0
    var totalBill: Double = 0.0
    var totalPerPerson: Double = 0.0
    

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.endEditing(true)
        
        splitPercent = Double(sender.tag / 100)
        switch sender.tag {
        case 0:
            zeroPctButton.isSelected = true
        case 10:
            tenPctButton.isSelected = true
        case 20:
            twentyPctButton.isSelected = true
        default:
            break
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel?.text = String(format: "%.0f", sender.value)
        splitNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        guard let totalBillString = billTextField?.text,
              let totalBill = Double(totalBillString)
        else {return}
        self.totalBill = totalBill + (totalBill * splitPercent)
        self.totalPerPerson = totalBill / Double(splitNumber)
        
        self.performSegue(withIdentifier: "ResultsViewController", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsViewController" {
            let vc = segue.destination as! ResultsViewController
            vc.numOfPeople = splitNumber
            vc.tip = Int(splitPercent * 100)
            vc.totalPerPerson = String(format: "%.2f", totalPerPerson)
        }
    }
    
}

