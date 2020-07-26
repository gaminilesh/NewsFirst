//
//  ArrayExtened.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 5/18/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//

import Foundation
extension Sequence where Iterator.Element:Hashable {
    var unique:[Iterator.Element] {
        var alreadyAdded = Set<Iterator.Element>()
        return self.filter { alreadyAdded.insert($0).inserted }
    }
}

extension Sequence where Element:Equatable {
    func removeNotContainIn(from:[Element]) -> [Element] {
        
        var result:[Element] = []
        
        for service in self{
            if from.contains(service) {
                result.append(service)
            }
        }
        return result
    }
}
extension Array where Element: NSCopying {
      func copy() -> [Element] {
            return self.map { $0.copy() as! Element }
      }
}
extension Array {
    func downloadAndSaveToDocumentDir(completion: ((_ isSuccess: Bool,[String]) -> Void)?) {
        var arrayOfImagePath  = [String]()
        let myGroup = DispatchGroup()
        for (strURL) in self{
            if let strURL = strURL as? String ,let url = URL(string: strURL){
                myGroup.enter()
                FileDownloader.loadFileAsync(url: url) { (path, error) in
                    if let path = path{
                        arrayOfImagePath.append(path)
                    }
                    myGroup.leave()
                }
            }
        }
        myGroup.notify(queue: .main) {
            completion?(true, arrayOfImagePath)
        }
    }

    subscript (safe index: Int) -> Element? {
        return index < count ? self[index] : nil
    }
    func grouped<T>(by criteria: (Element) -> T) -> [T: [Element]] {
        var groups = [T: [Element]]()
        for element in self {
            let key = criteria(element)
            if groups.keys.contains(key) == false {
                groups[key] = [Element]()
            }
            groups[key]?.append(element)
        }
        return groups
    }
}

