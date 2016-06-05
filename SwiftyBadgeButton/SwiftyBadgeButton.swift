//
//  SwiftyBadgeButton.swift
//  SwiftyBadgeButton
//
//  Created by Raphael Cruzeiro on 04/06/16.
//  Copyright © 2016 Raphael Cruzeiro. All rights reserved.
//

import Foundation

public class SwiftyBadgeButton: UIButton {
    
    public let badgeLabel = UILabel()
    
    public var animated = true
    
    public var badgeSize = CGSize(width: 15, height: 15) {
        didSet {
            badgeLabel.frame.size = badgeSize
            layoutSubviews()
        }
    }
    
    public var badgeText: String? {
        didSet {
            let wasNil = badgeLabel.text == nil
            badgeLabel.hidden = badgeText == nil
            badgeLabel.text = badgeText
            
            setSize()
            
            if animated {
                
                let animations: () -> Void = { [weak badgeLabel] in
                    badgeLabel?.layer.transform = CATransform3DMakeScale(1, 1, 1)
                }
                
                if wasNil {
                    badgeLabel.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
                }
                
                UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: animations, completion: nil)
                
            }
        }
    }
    
    public var badgeBackgroundColor = UIColor.redColor() {
        didSet {
            badgeLabel.backgroundColor = badgeBackgroundColor
        }
    }
    
    public var badgeFont = UIFont.systemFontOfSize(10) {
        didSet {
            badgeLabel.font = badgeFont
        }
    }
    
    public var badgeTextColor = UIColor.whiteColor() {
        didSet {
            badgeLabel.textColor = badgeTextColor
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public init() {
        super.init(frame: CGRectZero)
        setup()
    }
    
    private func setup() {
        addSubview(badgeLabel)
        
        badgeLabel.frame.size = badgeSize
        badgeLabel.clipsToBounds = true
        badgeLabel.hidden = true
        badgeLabel.textAlignment = .Center
        badgeLabel.backgroundColor = badgeBackgroundColor
        badgeLabel.font = badgeFont
        badgeLabel.textColor = badgeTextColor
    }
    
    private func setSize() {
        if badgeText != nil {
            badgeLabel.sizeToFit()
            let padding = max(badgeSize.height - badgeLabel.frame.size.height, 0)
            
            badgeLabel.frame.size = CGSize(width: max(badgeLabel.bounds.size.width + padding, 15), height: badgeSize.height)
        }
        
        badgeLabel.frame.origin = CGPoint(x: bounds.size.width - badgeLabel.bounds.size.width / 2, y: -badgeLabel.bounds.size.height / 2)
        badgeLabel.layer.cornerRadius = badgeLabel.bounds.size.height / 2
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setSize()
    }
    
}