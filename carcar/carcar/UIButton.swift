//
//  UIButton.swift
//  carcar
//
//  Created by KMLee on 2018. 5. 15..
//  Copyright © 2018년 MacMorning. All rights reserved.
//

import UIKit

class UIRoundButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 10.0;
        self.backgroundColor = UIColor(red: 37/255, green: 46/255, blue: 68/255, alpha: 0)
        self.layer.borderColor = UIColor(red: 37/255, green: 46/255, blue: 68/255, alpha: 1).cgColor
        self.layer.borderWidth = 3
    }
}
