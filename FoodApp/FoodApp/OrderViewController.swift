//
//  OrderViewController.swift
//  FoodApp
//
//  Created by Bilal Khan on 22/01/21.
//

import UIKit
import MapKit
import JKSteppedProgressBar

class OrderViewController: UIViewController {
    var tab = 0  // to keep track on the timeline pins
    
    var images = [UIImage(named: "DaisyDuck")!,
                  UIImage(named: "MickeyMouse")!,
                  UIImage(named: "MinnieMouse")!,UIImage(named: "MinnieMouse")!,UIImage(named: "MinnieMouse")!,]
    
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var trackOrder: UIButton!
    @IBOutlet weak var location: UIImageView!
    @IBOutlet weak var progressBar: SteppedProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderTracking()
        reportBtn()
        configureProgressBarWithImages()
        changingTimeLinePins()
        
    }
    
    private func changingTimeLinePins(){
        for i in 0...images.count{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 2) { [self] in
                progressBar.currentTab = tab + i
            }
        }
    }
    
    private func orderTracking(){
        self.trackOrder.setImage(UIImage(named: "location"), for: UIControl.State.normal)
        self.trackOrder.semanticContentAttribute = .forceLeftToRight
        self.trackOrder.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 9)
        trackOrder.layer.cornerRadius = 10
    }
    
    private func reportBtn(){
        reportButton.layer.cornerRadius = self.reportButton.frame.height/2
        reportButton.isUserInteractionEnabled = false
    }

    
    @IBAction func trackOrder(_ sender: UIButton) {
        let url = URL(string: "http://maps.apple.com/maps?saddr=&daddr=\(28.664110),\(77.116040)")
        UIApplication.shared.open(url!)
    }

    
    func configureProgressBarWithImages() {
        let inactiveimages = [UIImage(named: "location")!,
                              UIImage(named: "location")!,
                              UIImage(named: "location")!,
                              UIImage(named: "location")!,
                              UIImage(named: "location")!]
        progressBar.images = inactiveimages
        progressBar.activeImages = images
        progressBar.titles = ["Cooking",
                              "Picked",
                              "On Way",
                              "Delivered",
                              "Done"]
    }
    
}
