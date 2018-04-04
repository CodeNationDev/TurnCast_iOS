//
//  CustomControls.swift
//  Turncast
//
//  Created by David Martín Sáiz on 4/4/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation
import UIKit

class UITextField_BottomBorder: UITextField , UITextFieldDelegate {
    
    let border = CALayer()
    let width = CGFloat(2.0)
    
    required init?(coder aDecoder: (NSCoder!)) {
        super.init(coder: aDecoder)
        self.delegate=self;
        border.borderColor = UIColor( red: 32.0/255, green: 53.0/255, blue:88.0/255, alpha: 1.0 ).cgColor
        self.layer.backgroundColor = UIColor.clear.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    
    override func drawText(in rect: CGRect) {
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
    }
}
