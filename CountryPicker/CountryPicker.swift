//
//  CountryPicker.swift
//  CountryPicker
//
//  Created by Maksim Mikheev on 13/11/15.
//  Copyright © 2015 Maksim Mikheev. All rights reserved.
//

import UIKit

protocol CountryPhoneCodePickerDelegate {
    func countryPhoneCodePicker(picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String)
}

struct Country {
    var code: String?
    var name: String?
    var phoneCode: String?
    
    init(code: String?, name: String?, phoneCode: String?) {
        self.code = code
        self.name = name
        self.phoneCode = phoneCode
    }
}

class CountryPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var countries: [Country]!
    var countryPhoneCodeDelegate: CountryPhoneCodePickerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        super.dataSource = self;
        super.delegate = self;
        
        countries = countryNamesByCode()
    }
    
    // MARK: - Country Methods
    
    func countryNamesByCode() -> [Country] {
        var countries = [Country]()
        
        for code in NSLocale.ISOCountryCodes() {
            let countryName = NSLocale.currentLocale().displayNameForKey(NSLocaleCountryCode, value: code)
            
            let phoneNumberUtil = NBPhoneNumberUtil.sharedInstance()
            let phoneCode: String? = "+\(phoneNumberUtil.getCountryCodeForRegion(code))"
            
            if phoneCode != "+0" {
                let country = Country(code: code, name: countryName, phoneCode: phoneCode)
                countries.append(country)
            }
        }
        
        countries.sortInPlace({ $0.name < $1.name })
        
        return countries
    }
    
    // MARK: - Picker Methods

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var resultView: CountryView
        
        if view == nil {
            resultView = (NSBundle.mainBundle().loadNibNamed("CountryView", owner: self, options: nil)[0] as! CountryView)
        } else {
            resultView = view as! CountryView
        }
        
        resultView.setup(countries[row])
        
        return resultView
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let country = countries[row]
        if let countryPhoneCodeDelegate = countryPhoneCodeDelegate {
            countryPhoneCodeDelegate.countryPhoneCodePicker(self, didSelectCountryCountryWithName: country.name!, countryCode: country.code!, phoneCode: country.phoneCode!)
        }
    }
}
