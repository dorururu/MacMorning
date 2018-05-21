//
//  ViewController.swift
//  carcar
//
//  Created by KMLee on 2018. 5. 15..
//  Copyright © 2018년 MacMorning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var photoAction: UIRoundButton1!
    
    func showImage() {
        homeImage.image = UIImage(named: "home.png")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
