//
//  ViewController.swift
//  DemoAppApi
//
//  Created by suraj kumar on 09/06/23.
//


import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = {
        ProductViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        registerXib()
        
        viewModel.fetchProduct()
        
        viewModel.reloadTableView = {
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
        
        return viewModel.productTableCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellTableViewCell.identifier, for: indexPath) as! TableCellTableViewCell
        
        let vm = viewModel.getCellViewModel(at: indexPath)
        cell.productViewModel = vm
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }
    
}


