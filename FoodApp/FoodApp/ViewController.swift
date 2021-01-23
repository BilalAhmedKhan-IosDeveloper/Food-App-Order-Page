//
//  ViewController.swift
//  FoodApp
//
//  Created by Bilal Khan on 21/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var order: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        order.layer.cornerRadius = self.order.frame.height/2
        // Do any additional setup after loading the view.
    }

    @IBAction func order(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToOrder", sender: self)
    }
    
}

