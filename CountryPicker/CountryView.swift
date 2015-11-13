//
//  CountryView.swift
//  CountryPicker
//
//  Created by Maksim Mikheev on 13/11/15.
//  Copyright © 2015 Maksim Mikheev. All rights reserved.
//

import UIKit

class CountryView: UIView {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(country: Country) {
        if let countryCode = country.countryCode {
            flagImageView.layer.borderWidth = 0.5
            flagImageView.layer.borderColor = UIColor.darkGrayColor().CGColor
            flagImageView.layer.cornerRadius = 1
            flagImageView.layer.masksToBounds = true
            flagImageView.image = UIImage(named: countryCode.lowercaseString)
        }
        
        countryNameLabel.text = country.countryName
        countryCodeLabel.text = country.countryPhoneCode
    }

}
