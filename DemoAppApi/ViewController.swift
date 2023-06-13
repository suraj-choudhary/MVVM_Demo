//
//  ViewController.swift
//  DemoAppApi
//
//  Created by suraj kumar on 09/06/23.
//


import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Welcome()
    lazy var viewModel = {
        ProductViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getProduct()
        tableView.delegate = self
        tableView.dataSource = self
        registerXib()
        
        
        viewModel.reloadTableView = {
            
            self.model = self.viewModel.products
            print(self.model.count)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func registerXib() {
      let tableCell = UINib(nibName: TableCellTableViewCell.identifier, bundle: nil)
       tableView.register(tableCell, forCellReuseIdentifier: TableCellTableViewCell.identifier)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellTableViewCell.identifier, for: indexPath) as! TableCellTableViewCell
        
        cell.pNameLabel.text = model[indexPath.row].title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
}


