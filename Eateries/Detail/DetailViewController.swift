//
//  DetailViewController.swift
//  Eateries
//
//  Created by Геннадий Вязьмин on 17/12/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImageView.image = UIImage(named: imageName)
    }
    


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        cell.keyLabel.text = "Some text in label"
        cell.valueLabel.text = "Some text in  veluelabel"
        return cell
        
    }
}
