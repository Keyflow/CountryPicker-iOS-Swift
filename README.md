# CountryPicker-iOS-Swift

CountryPicker-iOS-Swift is an example Xcode project written in Swift for a modified UIPickerView that allows users to select a country from the list. We in [Keyflow](https://www.keyflow.com/) use it for letting our users to select the country code for his/her phone number on registration, etc. Country picker displays country flags, country names and country phone codes (might be anything instead of country phone codes) like on the picture below.

![Country Picker](/countryPicker.png?raw=true)

## Dependencies

This project uses flag images from [flag-icon-css repo](https://github.com/lipis/flag-icon-css/tree/master/flags/4x3) by [Lipis](https://github.com/lipis) converted from `.svg` to `.png`. Countries' phone codes are being set with the help of [libPhoneNumber for iOS](https://github.com/iziz/libPhoneNumber-iOS). If you don't need countries' phone codes in your country picker you might get rid of that library in the project.

## How to use it

In order to use the country picker from this project add these files to your project: `CountryPicker.swift`, `CountryView.swift`, `CountryView.xib` and `Flags.xassets`. If you need to have countries' phone codes to be set in your picker add [libPhoneNumber for iOS](https://github.com/iziz/libPhoneNumber-iOS) following instructions in the description of that library.

Also please keep in mind that libPhoneNumber for iOS is an Objective-C library, so you'll need to add a [bridging header](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) in order to make it work with Swift code if you don't already have one in your project.

You can select the country that is currently set on device like that (here `code` is ISO 3166-1 country code):

```
let locale = NSLocale.currentLocale()
let code = locale.objectForKey(NSLocaleCountryCode) as! String
countryPhoneCodePicker.setCountry(code)
``` 

Your code can listen to country selection changes via a delegate method like that:

```
func countryPhoneCodePicker(picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String) {
    selectedCountryLabel.text = name + " " + countryCode + " " + phoneCode
}
```

For more details on how country pickers work please see the code of the project.

## License

This project is licensed under the terms of the MIT [license](https://github.com/Keyflow/CountryPicker-iOS-Swift/blob/master/LICENSE.md).