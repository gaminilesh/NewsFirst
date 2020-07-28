//
//  StringExtened.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 5/15/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//

import Foundation
import UIKit

extension String {

    var integerValue: Int? {
        return NSString(string: self).integerValue
    }
    var floatValue: Float? {
        return NSString(string: self).floatValue
    }
    var doubleValue: Double? {
        return NSString(string: self).doubleValue
    }
}
extension String {
    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }
    var pathExtension: String {
        return fileURL.pathExtension
    }
    var lastPathComponent: String {
        return fileURL.lastPathComponent
    }
}
//MARK: Validations
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

extension String {

    var notEmpty: String? {
        if self != "" {
            return self
        }
        return nil
    }
    var isValidEmail:Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: self)
    }
    var isNumber:Bool{
        var flag: Bool = false
        if Int(self) != nil{
            flag = true
        }
        if self == ""{
            flag = true
        }
        let whitespace = NSCharacterSet.whitespaces
        let range = self.rangeOfCharacter(from: whitespace)
        if range != nil {
            flag =  true
        }
        return flag
    }

    var isCharacterAndNumber:Bool{
        var flag: Bool = false
        let characterSet = CharacterSet.letters
        if self.rangeOfCharacter(from: characterSet.inverted) == nil {
            flag =  true
        }
        if Int(self) != nil{
            flag = true
        }
        let whitespace = NSCharacterSet.whitespaces
        let range = self.rangeOfCharacter(from: whitespace)
        if range != nil {
            flag =  true
        }
        return flag
    }
    var isCharacter:Bool{
        var flag: Bool = false
        let characterSet = CharacterSet.letters
        if self.rangeOfCharacter(from: characterSet.inverted) == nil {
            flag =  true
        }
        let whitespace = NSCharacterSet.whitespaces
        let range = self.rangeOfCharacter(from: whitespace)
        if range != nil {
            flag =  true
        }
        return flag
    }

    var isValidLoginPin:Bool {
        print(self)
        var flag: Bool = false
        for (_ , value) in self.enumerated() {
            if(first != value){
                flag = true
                break;
//                return flag
            }
        }
        if self == "123456"{
            flag = false
            return flag
        }
        
        let MAX_MATCHED_COUNT = 3
        var matched_count = 1
        let length = self.count
        for (index, element) in self.enumerated() {
            if index < length - 1 && element == self[index + 1]{
                matched_count = matched_count + 1
                if matched_count == MAX_MATCHED_COUNT {
                    flag = false
                    return flag
                }
            }else{
                matched_count = 1;
                flag = true
            }
        }
        // Check consecutive sequential incremental number are there or not in STRING
        matched_count = 1
        for (index, element) in self.enumerated() {
            if index < length - 1{

                if let tempValue = Int(String(element)),
                    let tempValue1 = Int(String((self[index + 1]))),
                    tempValue + 1 == tempValue1{
                    matched_count = matched_count + 1
                    if matched_count == MAX_MATCHED_COUNT {
                        flag = false
                        return flag
                    }
                }else{
                    matched_count = 1;
                    flag = true
                }
            }
        }
        // Check consecutive sequential decremental number are there or not in STRING
        matched_count = 1
        for (index, element) in self.enumerated() {
            if index < length - 1{
                
                if let tempValue = Int(String(element)),
                    let tempValue1 = Int(String((self[index + 1]))),
                    tempValue - 1 == tempValue1{
                    matched_count = matched_count + 1
                    if matched_count == MAX_MATCHED_COUNT {
                        flag = false
                        return flag
                    }
                }else{
                    matched_count = 1;
                    flag = true
                }
            }
        }

        return flag
    }
    
}

extension String {

    var base64Decoded: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
//    var base64Encoded: Data? {
//        return Data(self.utf8).base64EncodedString()
//    }
//
    var trimWhiteSpaceAndNewlines: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    func replacingOccurrences(of:String, with: String, index: Int) -> String {
        var chars = self
        let startIndex = index
        let endIndex = index + of.count
        if chars.count > startIndex, chars.count > endIndex {
            let start = chars.index(chars.startIndex, offsetBy: startIndex);
            let end = chars.index(chars.startIndex, offsetBy: endIndex)
            chars = chars.replacingOccurrences(of: of, with: with, range: start..<end)
        }
        return chars
    }
    func removeFirstOccurrences(of target: String) -> String? {

        var animal = self
        if let range = animal.range(of: target) {
            animal = animal.replacingCharacters(in: range, with: "")
            return animal
        }
        return nil
    }
    func removeFirstOccurrencesWithCurrentString(of target: String) -> String {

        var animal = self
        if let range = animal.range(of: target) {
            animal = animal.replacingCharacters(in: range, with: "")
            return animal
        }
        return animal
    }
    func trimLeadingZeroes(input: String) -> String {
        var result = ""
        for character in input {
            if result.isEmpty && character == "0" { continue }
            result.append(character)
        }
        return result
    }
    
//    let mutableString = NSMutableAttributedString(string: "4. \(Languages.Send_a_picture_of_the_receipt_to_Whatsapp)", attributes: [.foregroundColor: appTheamColor.textDisplay, .font: AppFont.Subhead])
//    mutableString.append("\n \(Languages.Whatsapp_xx1.localizedReplace(with: whatsUpNumber))".mutableAttributedString(font: AppFont.Bold_Subhead, textColor: appTheamColor.textDisplay))
//    lblTitle6.attributedText = mutableString


    func mutableAttributedString(font: UIFont, textColor: UIColor, underlines:Any? = nil , paragraph:NSMutableParagraphStyle? = nil) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key : Any] = [.foregroundColor: textColor, .font: font]
        if let underlines = underlines {
            attributes[.underlineStyle] = underlines
        }
        if let paragraph = paragraph {
            attributes[.paragraphStyle] = paragraph
        }
        return NSMutableAttributedString(string: self, attributes: attributes)
                
    }
    func attributedString(font: UIFont, textColor: UIColor, underlines:Any? = nil, paragraph:NSMutableParagraphStyle? = nil) -> NSAttributedString {
        var attributes: [NSAttributedString.Key : Any] = [.foregroundColor: textColor, .font: font]
        if let underlines = underlines {
            attributes[.underlineStyle] = underlines
        }
        if let paragraph = paragraph {
            attributes[.paragraphStyle] = paragraph
        }

        return NSAttributedString(string: self, attributes: attributes)
    }
    mutating func hideStringWithStar(sufixCount:Int) -> String{
        //https://stackoverflow.com/questions/12083605/formatting-a-uitextfield-for-credit-card-input-like-xxxx-xxxx-xxxx-xxxx
        var formatedCardNumber = ""
        var i :Int = 0
        //loop for every character
        for character in self{
            //in case you want to replace some digits in the middle with * for security
            if(i < self.count - sufixCount || i >= self.count - 0){
                formatedCardNumber = formatedCardNumber + "*"
            }else{
                formatedCardNumber = formatedCardNumber + String(character)
            }
            //insert separators every 4 spaces(magic number)
            if(i == 3 || i == 7 || i == 11 || (i == 15 && self.count > 16 )){
                formatedCardNumber = formatedCardNumber + " "
                // could use just " " for spaces
            }
            
            i = i + 1
        }
        return formatedCardNumber
    }

    mutating func hideMobileStringWithStar(sufixCount:Int) -> String{
        
        var hiddenDebitCardNumber = ""
        let offset = self.count - sufixCount
        
        let start = self.startIndex
        let end = self.index(self.startIndex, offsetBy: offset)
        for _ in 0..<offset {
            hiddenDebitCardNumber.append("*")
        }
        self.replaceSubrange(start..<end, with: hiddenDebitCardNumber)
        
        return self
    }

    mutating func spaceStringWithOutStar(sufixCount:Int) -> String{
        
        //https://stackoverflow.com/questions/12083605/formatting-a-uitextfield-for-credit-card-input-like-xxxx-xxxx-xxxx-xxxx
        var formatedCardNumber = ""
        var i :Int = 0
        //loop for every character
        for character in self{
            //in case you want to replace some digits in the middle with * for security
            if(i < self.count - sufixCount || i >= self.count - 0){
                formatedCardNumber = formatedCardNumber + String(character)
            }else{
                formatedCardNumber = formatedCardNumber + String(character)
            }
            //insert separators every 4 spaces(magic number)
            if(i == 3 || i == 7 || i == 11 || (i == 15 && self.count > 16 )){
                formatedCardNumber = formatedCardNumber + " "
                // could use just " " for spaces
            }
            
            i = i + 1
        }
        return formatedCardNumber
    }
    
    //MARK:- Check String With Regex
    func checkValidStringWithRegex(_ regex:String)->Bool {
        
        var returnValue = true
        let emailRegEx = regex
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            if results.count == 0 {
                returnValue = false
            }
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return  returnValue
    }
}

extension NSString {

    var toBool:Bool? {
        switch self {
        case "True", "true", "yes", "Yes", "1":
            return true
        case "False", "false", "no", "No", "0":
            return false
        default:
            return nil
        }
    }
    var htmlAttributedString: NSAttributedString? {
        return try? NSAttributedString(data: self.data(using: String.Encoding.unicode.rawValue, allowLossyConversion: true)!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)

    }

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return boundingBox.height
    }

    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return boundingBox.width
    }
}
