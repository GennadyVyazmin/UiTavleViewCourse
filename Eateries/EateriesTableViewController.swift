//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Ivan Akulov on 29/09/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    var restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    var restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    var restorauntIsVisited = [Bool](repeating: false, count: 15)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurantNames[indexPath.row]
        
        cell.accessoryType =  self.restorauntIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let ac = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
//        let call = UIAlertAction(title: "Позвонить: +7(347)111-111\(indexPath.row)", style: .default){
//            (action: UIAlertAction) -> Void in
//
//            let alertC = UIAlertController(title: nil, message: "Calling is down", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alertC.addAction(ok)
//            self.present(alertC, animated: true, completion: nil)
//        }
//
//        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        let isVisibleTitle = self.restorauntIsVisited[indexPath.row] ? "Я не был здесь" : " Я был здесь"
//        let isVisited = UIAlertAction(title: isVisibleTitle, style: .default) {
//            (action) in
//            let cell = tableView.cellForRow(at: indexPath)
//
//            self.restorauntIsVisited[indexPath.row] = !self.restorauntIsVisited[indexPath.row]
//            cell?.accessoryType = self.restorauntIsVisited[indexPath.row] ? .checkmark : .none
//        }
//        ac.addAction(cancel)
//        ac.addAction(call)
//        ac.addAction(isVisited)
//        present(ac, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
     
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        if editingStyle == .delete {
    //            self.restorauntIsVisited.remove(at: indexPath.row)
    //            self.restaurantImages.remove(at: indexPath.row)
    //            self.restaurantNames.remove(at: indexPath.row)
    //        }
    //
    //        tableView.deleteRows(at: [indexPath], with: .automatic )
    //    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            let defaultText = "I am in " + self.restaurantNames[indexPath.row]
            if let image = UIImage(named: self.restaurantImages[indexPath.row]){
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.restorauntIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic )
            
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return [delete, share]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DetailViewController
                dvc.imageName = self.restaurantImages[indexPath.row]
            }
        }
    }
}
