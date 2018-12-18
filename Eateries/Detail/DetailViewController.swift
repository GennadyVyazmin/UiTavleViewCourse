//
//  DetailViewController.swift
//  Eateries
//
//  Created by Геннадий Вязьмин on 17/12/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImageView.image = UIImage(named: imageName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
