//
//  BasketViewController.swift
//  CollectionViewTesting
//
//  Created by Mac on 10.02.2023.
//

import UIKit

class BasketViewController: UIViewController {
    
    var vm = ViewModel()
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var ProductTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ProductTableView.dataSource = self
        //self.ProductTableView.delegate = self
        
        self.ProductTableView.register(UINib(nibName: "ResultProductTVCell", bundle: nil), forCellReuseIdentifier: "ResultProductTVCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.totalLabel.text = String(ViewModel.totalPrice)
        self.ProductTableView.reloadData()
    }
    
    @IBAction func ClearListPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Shure?", message: "really want to clear list?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler: { action in
            self.vm.zeroPrice()
            self.vm.clearList()
            self.ProductTableView.reloadData()
            self.totalLabel.text = "0"
        }))
        alert.addAction(UIAlertAction(title: "no", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }
    
}


// TableView EXT

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.resultProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultProductTVCell") as! ResultProductTVCell
        
        cell.setupCell(product: ViewModel.resultProducts[indexPath.row])
        
        return cell
    }
    
}



