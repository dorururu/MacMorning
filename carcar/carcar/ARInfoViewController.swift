//
//  ARInfoViewController.swift
//  carcar
//
//  Created by KMLee on 2018. 5. 31..
//  Copyright © 2018년 MacMorning. All rights reserved.
//
import UIKit
import Foundation

class ARInfoViewController: UIViewController {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    var carImage = UIImage(named: "noImage.png")
    
    
    func showImage(_ carName: String) {
        carImageView.layer.cornerRadius = 90
        carImageView.layer.borderWidth = 2
        carImageView.layer.borderColor = UIColor.clear.cgColor
        carImageView.layer.masksToBounds = true;
        
        carImage = UIImage(named: carName)
        carImageView.image = carImage
        
    }

}
