//
//  Helper.swift
//  Mobifin
//
//  Created by Chirag on 12/21/18.
//  Copyright © 2018 Panamax IOS Team. All rights reserved.
//

import Foundation

extension NSString{
    
    func jsonParseObject() -> Any? {
        
        guard let data = self.data(using: String.Encoding.utf8.rawValue) else {return nil}
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: [])
            return object
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func jsonParseDictionary() -> [String: Any]? {
        
        return self.jsonParseObject() as? [String : Any]
    }
    
    func jsonParseArray() -> [Any]? {
        
        return self.jsonParseObject() as? [Any]
    }
}

extension String{
    
    func jsonParseObject() -> Any? {
        
        if let data = self.data(using: .utf8) {
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: [])
                return object
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func jsonParseDictionary() -> [String: Any]? {
        
        return self.jsonParseObject() as? [String : Any]
    }
    
    func jsonParseArray() -> [Any]? {
        
        return self.jsonParseObject() as? [Any]
    }
}

extension NSDictionary{
    
    func jsonParseString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            // here "jsonData" is the dictionary encoded in JSON data
            
            guard let string = String(data: jsonData, encoding: .utf8) else{
                return nil
            }
            return string
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
extension NSArray{
    
    func jsonParseString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            // here "jsonData" is the dictionary encoded in JSON data
            
            guard let string = String(data: jsonData, encoding: .utf8) else{
                return nil
            }
            return string
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension Array{
    
    func jsonParseString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            // here "jsonData" is the dictionary encoded in JSON data
            
            guard let string = String(data: jsonData, encoding: .utf8) else{
                return nil
            }
            return string
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension Dictionary{
    
    func jsonParseString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            // here "jsonData" is the dictionary encoded in JSON data
            
            guard let string = String(data: jsonData, encoding: .utf8) else{
                return nil
            }
            return string
        }
        catch
        {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension Dictionary
{
    var json: String
    {
        let invalidJson = "Not a valid JSON"
        do
        {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        }
        catch
        {
            return invalidJson
        }
    }
    
    func dict2json() -> String
    {
        return json
    }
}
//https://gist.github.com/asmallteapot/5bef591b22ef59f7a27bd1d3a0a8ff8f
extension Dictionary where Value: RangeReplaceableCollection {
    public mutating func append(element: Value.Iterator.Element, toValueOfKey key: Key) -> Value? {
        var value: Value = self[key] ?? Value()
        value.append(element)
        self[key] = value
        return value
    }
}

