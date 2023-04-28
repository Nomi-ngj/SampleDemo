//
//  ViewController.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!{
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    let viewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        handleAPI()
    }
    
    private func handleAPI(){
        viewModel.serviceSuccess = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){ [weak self] in
                guard let self else {return}
                title = viewModel.responesModel?.heading ?? ""
                tableView.reloadData()
            }
        }
        
        viewModel.loadService()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.item(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = item?.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = viewModel.item(indexPath: indexPath) else {return}
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.item = item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
