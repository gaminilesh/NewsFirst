//
//  File.swift
//  MobifinElite
//
//  Created by Chirag on 1/7/19.
//  Copyright © 2019 Panamax IOS Team. All rights reserved.
//

import Foundation

struct Languages
{
    static var srt_Loading: String {return "str_key_Loading".localized}
    static var str_Server_not_reachable: String {return "str_key_Server_not_reachable".localized}
    static var str_Internal_Server_Error: String {return "str_key_Internal_Server_Error".localized}
    static var str_Can_not_serve_the_request: String {return "str_key_Can_not_serve_the_request".localized}
    static var str_Connection_failed: String {return "str_key_Connection_failed".localized}
    static var str_Internet_is_not_connected: String {return "str_key_Internet_is_not_connected".localized}
    static var str_Invalid_Response: String {return "str_key_Invalid_Response".localized}
    static var str_Checksum_not_matched: String {return "str_key_Checksum_not_matched".localized}
    static var str_key_Are_you_sure_you_want_to_delete_XX1_QuestionSign: String{ return  "str_key_Are you sure you want to delete XX1 ?".localized}
    static var str_key_Invalid_Json : String{ return  "str_key_Invalid_Json".localized}
    static var str_key_Invalid_Data : String{ return  "str_key_Invalid_Data".localized}

    

}


extension String {
    
    var localized: String {
        return  NSLocalizedString(self, comment: "") //Languages.LocStr(self)//
    }
    
    func localizedReplace(with items: String...) -> String {
        var myString = self
        for (index, item) in items.enumerated() {
            let replaceStr = "@@\(index+1)"
            myString = myString.replacingOccurrences(of: replaceStr, with: item)
        }
        return myString
    }
}

extension NSMutableAttributedString {
    
    func localizedReplace(with items: NSAttributedString?...) {
        let myString = self
        for (index, item) in items.enumerated() {
            if let item = item {
                let replaceStr = "@@\(index+1)"
                let range = (myString.string as NSString).range(of: replaceStr)
                myString.replaceCharacters(in: range, with: item)
            }
        }
    }
}
