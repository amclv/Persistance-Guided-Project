//
//  StarsViewController.swift
//  Stars
//
//  Created by Aaron Cleveland on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let starControllers = StarControllers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the view controller as the delegate (data source) of the table view
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func printStars(_ sender: Any) {
        
    }
    
    @IBAction func createStars(_ sender: Any) {
        guard let name = nameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else { return }
        
        // let the model controller handle creating the Star
        starControllers.createStar(with: name, distance: distance)
        
        // there is a new star, make a cell for it
        tableView.reloadData()
    }
    
}

extension StarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starControllers.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath)
        let star = starControllers.stars[indexPath.row]
        cell.textLabel?.text = star.name
        cell.detailTextLabel?.text = "\(star.distance) light years away"
        return cell
    }
    
    
}
