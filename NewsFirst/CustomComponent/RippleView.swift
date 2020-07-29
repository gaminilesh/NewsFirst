//
//  RippleView.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 28/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class RippleView: UIView {
    
    
    @IBOutlet weak var btnText: UIButton!
    @IBOutlet weak var viewRipple: UIView!
    
    //Testing
    class func instanceFromNib() -> RippleView {
        return UINib(nibName: "RippleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RippleView
    }
    
    override func draw(_ rect: CGRect) {
        btnText.layer.cornerRadius = btnText.frame.size.height / 2
        btnText.titleLabel?.numberOfLines = 2
        btnText.titleLabel?.textAlignment = .center
        btnText.setTitle("Trump\nVisit", for: .normal)
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBAction func btnTextTap(_ sender: UIButton) {
        print("Click Action")
    }
    
    var showRippleEffecr : Bool? {
        didSet{
            Timer.scheduledTimer(timeInterval:0.5, target: self, selector: #selector(self.groupCircleAnimation1), userInfo: nil, repeats: false)
          //  Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.groupCircleAnimation1), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval:1.5, target: self, selector: #selector(self.groupCircleAnimation1), userInfo: nil, repeats: false)
          //  Timer.scheduledTimer(timeInterval:1.8, target: self, selector: #selector(self.groupCircleAnimation1), userInfo: nil, repeats: false)
        }
    }
    
    @objc func groupCircleAnimation1() {
           //let circle1 = viewRipple
                 //circle1.frame = CGRect(x: 200, y: 200, width: 15, height: 15)
                // circle1.center = CGPoint(x: 115, y: 110)
                 //self.view.addSubview(circle1)
                 
                 let layer = getLayer(view: viewRipple)
                 let animation1 = getAnimation()
                 layer.add(animation1, forKey: nil)
                 viewRipple.superview?.layer.addSublayer(layer)
              
                 
                // circle1.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
                // circle1.center = CGPoint(x: 230, y: 200)
                 
                 let layer1 = getLayer(view: viewRipple)
                 let animation2 = getAnimation()
                 
                 layer1.add(animation2, forKey: nil)
                 viewRipple.superview?.layer.addSublayer(layer1)
                 
                // viewRipple.removeFromSuperview()
       }
       
       private func getAnimation() -> CAAnimationGroup {
           // Scale Animation
           let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
           scaleAnimation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
           scaleAnimation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(CGFloat(6), 2, 1))
           
           // Alpha Animation
           let alphaAnimation = CABasicAnimation(keyPath: "opacity")
           alphaAnimation.fromValue = 1
           alphaAnimation.toValue = 0
           
           let animation = CAAnimationGroup()
           animation.animations = [scaleAnimation, alphaAnimation]
        animation.duration = 2
           animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.repeatCount = 3000
           return animation
       }

       private func getLayer(view:UIView) -> CAShapeLayer {
              //Minimum bounds
        
              let pathFrame: CGRect = CGRect(x: -view.bounds.midX, y: -view.bounds.midY, width: view.bounds.size.width, height: view.bounds.size.height)
              let path = UIBezierPath(roundedRect: pathFrame, cornerRadius: view.frame.size.height)
              let shapePosition = CGPoint(x: view.frame.midX, y: view.frame.midY)
              let circleShape = CAShapeLayer()
              circleShape.path = path.cgPath
              
              //position set to Center of bounds. If set to origin, it will only expand to +x and +y
              circleShape.position = shapePosition
        circleShape.fillColor = UIColor(displayP3Red: 173/255, green: 0, blue: 25/255, alpha: 0.6).cgColor // UIColor.red.withAlphaComponent(0.5).cgColor
              circleShape.opacity = 0//Opacity is 0 so it is invisible in initial state
              circleShape.zPosition = -10
              circleShape.strokeColor = UIColor(displayP3Red: 173/255, green: 0, blue: 25/255, alpha: 0.75).cgColor //UIColor.red.withAlphaComponent(0.8).cgColor
              circleShape.lineWidth = 0.1// CGFloat(self.rippleThickness)
              return circleShape
          }
    
}

