//
//  ViewController.swift
//  IntroToCombine
//
//  Created by Matthew Dolan on 2021-11-14.
//

import UIKit
import Combine

class MyCustomTableViewCell: UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(MyCustomTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var models = [String]()
    
    var observer: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        observer = APICaller.shared.fetchCompanies()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finished")
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { [weak self] value in
            self?.models = value
            self?.tableView.reloadData()
                
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableViewCell else {
            fatalError()
        }
        
        cell.textLabel?.text = models[indexPath.row]
        
        return cell
    }
}

