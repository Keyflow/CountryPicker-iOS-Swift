import UIKit

class ViewController: UIViewController, CountryPhoneCodePickerDelegate {
    
    @IBOutlet weak var selectedCountryLabel: UILabel!
    @IBOutlet weak var countryPhoneCodePicker: CountryPicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        let locale = NSLocale.currentLocale()
        let code = locale.objectForKey(NSLocaleCountryCode) as! String
        
        countryPhoneCodePicker.countryPhoneCodeDelegate = self
        countryPhoneCodePicker.setCountry(code)
    }
    
    // MARK: - CountryPhoneCodePicker Delegate
    
    func countryPhoneCodePicker(picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String) {
        selectedCountryLabel.text = name + " " + countryCode + " " + phoneCode
    }
    
}

