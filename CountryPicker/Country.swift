//
//  Country.swift
//  CountryPicker
//
//  Created by Maksim Mikheev on 13/11/15.
//  Copyright © 2015 Maksim Mikheev. All rights reserved.
//

import Foundation

struct Country {
    var countryCode: String?
    var countryName: String?
    var countryPhoneCode: String?
    
    init(countryCode: String?, countryName: String?, phoneCode: String?) {
        self.countryCode = countryCode
        self.countryName = countryName
        self.countryPhoneCode = phoneCode
    }
}