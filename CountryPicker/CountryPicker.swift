//
//  CountryPicker.swift
//  CountryPicker
//
//  Created by Maksim Mikheev on 13/11/15.
//  Copyright © 2015 Maksim Mikheev. All rights reserved.
//

import UIKit

class CountryPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var countries: [Country]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
//        let GoodOldBritain = Country(countryCode: "gb", countryName: "The United Kingdom", phoneCode: "+44")
//        let Denmark = Country(countryCode: "dk", countryName: "Denmark", phoneCode: "+45")
//        let Sweden = Country(countryCode: "se", countryName: "Sweden", phoneCode: "+46")
//        let Norway = Country(countryCode: "no", countryName: "Norway", phoneCode: "+47")
//        let Russia = Country(countryCode: "ru", countryName: "Russian Federation", phoneCode: "+7")
//        countries = [GoodOldBritain, Denmark, Sweden, Norway, Russia]
        
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
            
            let country = Country(countryCode: code, countryName: countryName, phoneCode: phoneCode)
            
            countries.append(country)
        }
        
        countries.sortInPlace({ $0.countryName < $1.countryName })
        
        return countries
    }
    
    // MARK: - Picker

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (countries?.count)!
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var resultView: CountryView?
        
        if view == nil {
            resultView = (NSBundle.mainBundle().loadNibNamed("CountryView", owner: self, options: nil)[0] as! CountryView)
//            print("New")
        } else {
            resultView = view as? CountryView
//            print("Old")
        }
        
        resultView?.setup(countries![row])
        
        return resultView!
    }

}
