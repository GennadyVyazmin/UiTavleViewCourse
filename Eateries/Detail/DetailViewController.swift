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
    
    
    var restourant: Restaurant?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImageView.image = UIImage(named: restourant!.image)
        
//        detailTableView.backgroundColor = #colorLiteral(red: 0.7832157016, green: 1, blue: 0.8538410068, alpha: 1)
//        detailTableView.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        detailTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        title = restourant!.name
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restourant!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restourant!.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = restourant!.location
        case 3:
            cell.keyLabel.text = "Я тут был"
            cell.valueLabel.text = restourant!.isVisited ? "Yes" : "No"
        default:
            break
        }
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
//        let alertVC = UIAlertController(title: "", message: "Вы здесь были?", preferredStyle: .actionSheet)
//        let yesIsVisited = UIAlertAction(title: "Yes", style: .default) { (action) in
//        cell.valueLabel.text =
//
        }
//        alertVC.addAction(yesIsVisited)
//        present(alertVC, animated: true, completion: nil)
    
}
