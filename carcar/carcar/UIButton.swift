//
//  UIButton.swift
//  carcar
//
//  Created by KMLee on 2018. 5. 15..
//  Copyright © 2018년 MacMorning. All rights reserved.
//

import UIKit

class UIRoundButton1: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = UIColor(red: 136/255, green: 199/255, blue: 193/255, alpha: 1)
    }
}


class UIRoundButton3: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = UIColor(red: 197/255, green: 162/255, blue: 219/255, alpha: 1)
    }
}
