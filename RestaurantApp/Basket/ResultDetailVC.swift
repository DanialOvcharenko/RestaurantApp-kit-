//
//  ResultDetailVC.swift
//  CollectionViewTesting
//
//  Created by Mac on 11.02.2023.
//

import UIKit

class ResultDetailVC: UIViewController {
    
    var vm = ViewModel()
    
    var addres: String = ""
    var date: String = ""

    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var checkingLabel: UILabel!
    @IBOutlet weak var dateChose: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkingLabel.text = "Total: " + String(ViewModel.totalPrice)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        checkingLabel.text = "Total: " + String(ViewModel.totalPrice)
    }
    
    func getDateFromPicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateField.text = formatter.string(from: dateChose.date)
    }

    @IBAction func checkmarkPressed(_ sender: Any) {
        if addressField.text != "" {
            
            self.addres = self.addressField.text ?? "test"
            checkingLabel.text = "Total: " + String(ViewModel.totalPrice) + "$ / " + self.addres + " / " + self.date
            
        } else {
            let alert = UIAlertController(title: "Stop", message: "please, write your adress", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }
    
    @IBAction func secondCheckPressed(_ sender: Any) {
        getDateFromPicker()
        self.date = self.dateField.text ?? "test"
        checkingLabel.text = "Total: " + String(ViewModel.totalPrice) + "$ / " + self.addres + " / " + self.date
    }
    
    @IBAction func orderPressed(_ sender: Any) {
        
        if ViewModel.totalPrice > 0{
            let alert = UIAlertController(title: "Cool", message: "our manager will call you for confirmation if you press 'ok'", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
                
                self.weCallYou()
                
                let alert = UIAlertController(title: "Thank you", message: "wait for the call", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                let when = DispatchTime.now() + 3
                DispatchQueue.main.asyncAfter(deadline: when) {
                    alert.dismiss(animated: true, completion: nil)
                }
                
            }))
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Sorry", message: "Your basket is empty, you should select some products before ordering", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
            let when = DispatchTime.now() + 5
            DispatchQueue.main.asyncAfter(deadline: when) {
                alert.dismiss(animated: true, completion: nil)
            }

        }
        
    }
    
    func weCallYou() {
        print("send order to the restaurant")
    }
}
