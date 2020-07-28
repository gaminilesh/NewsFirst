//
//  AppFont.swift
//
//
//  Created by Ravi Malviya on 27/04/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//

import Foundation
import UIKit

struct AppFont {
    //MARK: Font
    static let RegularFontName = "MADETOMMY"
    static let MediumFontName = "MADETOMMY-Medium"
    static let BoldFontName = "MADETOMMY-Bold"


    struct Size {
        //https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/
        static let TitleGiant = CGFloat(40)
        static let TitleGiant2 = CGFloat(38)
        static let TitleGiant3 = CGFloat(36)
        
        static let Title = CGFloat(34)
        static let Title1 = CGFloat(28)
        static let Title2 = CGFloat(22)
        static let Title3 = CGFloat(20)
        static let Headline = CGFloat(17)
        static let Body = CGFloat(17)
        static let Callout = CGFloat(16)
        static let Subhead = CGFloat(15)
        static let Footnote = CGFloat(13)
        static let caption1 = CGFloat(12)
        static let caption2 = CGFloat(11)
    }

    
    static let Title: UIFont = UIFont(name: RegularFontName, size: Size.Title)!
    static let Title1: UIFont = UIFont(name: RegularFontName, size: Size.Title1)!
    static let Title2: UIFont = UIFont(name: RegularFontName, size: Size.Title2)!
    static let Title3: UIFont = UIFont(name: RegularFontName, size: Size.Title3)!
    static let Headline: UIFont = UIFont(name: RegularFontName, size: Size.Headline)!
    static let Body: UIFont = UIFont(name: RegularFontName, size: Size.Body)!
    static let Callout: UIFont = UIFont(name: RegularFontName, size: Size.Callout)!
    static let Subhead: UIFont = UIFont(name: RegularFontName, size: Size.Subhead)!
    static let Footnote: UIFont = UIFont(name: RegularFontName, size: Size.Footnote)!
    static let caption1: UIFont = UIFont(name: RegularFontName, size: Size.caption1)!
    static let caption2: UIFont = UIFont(name: RegularFontName, size: Size.caption2)!

//    static let SemiBold_Title: UIFont = UIFont(name: SemiBoldFontName, size: Size.Title)!
//    static let SemiBold_Title1: UIFont = UIFont(name: SemiBoldFontName, size: Size.Title1)!
//    static let SemiBold_Title2: UIFont = UIFont(name: SemiBoldFontName, size: Size.Title2)!
//    static let SemiBold_Title3: UIFont = UIFont(name: SemiBoldFontName, size: Size.Title3)!
//    static let SemiBold_Headline: UIFont = UIFont(name: SemiBoldFontName, size: Size.Headline)!
//    static let SemiBold_Body: UIFont = UIFont(name: SemiBoldFontName, size: Size.Body)!
//    static let SemiBold_Callout: UIFont = UIFont(name: SemiBoldFontName, size: Size.Callout)!
//    static let SemiBold_Subhead: UIFont = UIFont(name: SemiBoldFontName, size: Size.Subhead)!
//    static let SemiBold_Footnote: UIFont = UIFont(name: SemiBoldFontName, size: Size.Footnote)!
//    static let SemiBold_caption1: UIFont = UIFont(name: SemiBoldFontName, size: Size.caption1)!
//    static let SemiBold_caption2: UIFont = UIFont(name: SemiBoldFontName, size: Size.caption2)!


    
    static let Medium_Title: UIFont = UIFont(name: MediumFontName, size: Size.Title)!
    static let Medium_Title1: UIFont = UIFont(name: MediumFontName, size: Size.Title1)!
    static let Medium_Title2: UIFont = UIFont(name: MediumFontName, size: Size.Title2)!
    static let Medium_Title3: UIFont = UIFont(name: MediumFontName, size: Size.Title3)!
    static let Medium_Headline: UIFont = UIFont(name: MediumFontName, size: Size.Headline)!
    static let Medium_Body: UIFont = UIFont(name: MediumFontName, size: Size.Body)!
    static let Medium_Callout: UIFont = UIFont(name: MediumFontName, size: Size.Callout)!
    static let Medium_Subhead: UIFont = UIFont(name: MediumFontName, size: Size.Subhead)!
    static let Medium_Footnote: UIFont = UIFont(name: MediumFontName, size: Size.Footnote)!
    static let Medium_caption1: UIFont = UIFont(name: MediumFontName, size: Size.caption1)!
    static let Medium_caption2: UIFont = UIFont(name: MediumFontName, size: Size.caption2)!


    static let Bold_Title: UIFont = UIFont(name: BoldFontName, size: Size.Title)!
    static let Bold_Title1: UIFont = UIFont(name: BoldFontName, size: Size.Title1)!
    static let Bold_Title2: UIFont = UIFont(name: BoldFontName, size: Size.Title2)!
    static let Bold_Title3: UIFont = UIFont(name: BoldFontName, size: Size.Title3)!
    static let Bold_Headline: UIFont = UIFont(name: BoldFontName, size: Size.Headline)!
    static let Bold_Body: UIFont = UIFont(name: BoldFontName, size: Size.Body)!
    static let Bold_Callout: UIFont = UIFont(name: BoldFontName, size: Size.Callout)!
    static let Bold_Subhead: UIFont = UIFont(name: BoldFontName, size: Size.Subhead)!
    static let Bold_Footnote: UIFont = UIFont(name: BoldFontName, size: Size.Footnote)!
    static let Bold_caption1: UIFont = UIFont(name: BoldFontName, size: Size.caption1)!
    static let Bold_caption2: UIFont = UIFont(name: BoldFontName, size: Size.caption2)!

    
    

}
