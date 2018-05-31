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
        switch carName {
        case "benz_eclass":
            carImage = UIImage(named: "benz_eclass.png")
        case "benz_gls":
            carImage = UIImage(named: "benz_gls.png")
        case "audi_a6":
            carImage = UIImage(named: "audi_a6.png")
        case "audi_q7":
            carImage = UIImage(named: "audi_q7.png")
        case "bmw_i3":
            carImage = UIImage(named: "bmw_i3.png")
        case "bmw_i8":
            carImage = UIImage(named: "bmw_i8.png")
        case "hyundai_kona":
            carImage = UIImage(named: "hyundai_kona.png")
        case "hyundai_veloster":
            carImage = UIImage(named: "hyundai_veloster.png")
        case "kia_k9":
            carImage = UIImage(named: "kia_k9.png")
        case "kia_allnewmorning":
            carImage = UIImage(named: "kia_allnewmorning.png")
        case "toyota_sienna":
            carImage = UIImage(named: "toyota_sienna.png")
        case "toyota_camry":
            carImage = UIImage(named: "toyota_camry.png")
        case "volkswagen_tiguan":
            carImage = UIImage(named: "volkswagen_tiguan.png")
        case "volkswagen_passat":
            carImage = UIImage(named: "volkswagen_passat.png")
        case "mini_countryman":
            carImage = UIImage(named: "mini_countryman.png")
        case "mini_hatch":
            carImage = UIImage(named: "mini_hatch.png")
        default:
            NSLog("error")
        }
        carImageView.image = carImage
    }
}
