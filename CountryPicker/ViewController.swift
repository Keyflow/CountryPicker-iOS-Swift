//
//  ViewController.swift
//  CountryPicker
//
//  Created by Maksim Mikheev on 13/11/15.
//  Copyright © 2015 Maksim Mikheev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountryPhoneCodePickerDelegate {
    
    @IBOutlet weak var selectedCountryLabel: UILabel!
    @IBOutlet weak var countryPhoneCodePicker: CountryPicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        countryPhoneCodePicker.countryPhoneCodeDelegate = self
    }
    
    // MARK: - CountryPhoneCodePicker Delegate
    
    func countryPhoneCodePicker(picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String) {
        selectedCountryLabel.text = name + " " + countryCode + " " + phoneCode
    }
    
}

