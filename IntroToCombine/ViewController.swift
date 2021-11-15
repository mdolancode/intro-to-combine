//
//  ViewController.swift
//  IntroToCombine
//
//  Created by Matthew Dolan on 2021-11-14.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(MyCustomTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableViewCell else {
            fatalError()
        }
        
        return cell
    }
}

