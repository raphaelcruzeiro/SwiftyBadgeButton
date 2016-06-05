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
    
    public var badgeSize = CGSize(width: 15, height: 15) {
        didSet {
            badgeLabel.frame.size = badgeSize
            layoutSubviews()
        }
    }
    
    public var badgeText: String? {
        didSet {
            badgeLabel.hidden = badgeText == nil
            badgeLabel.text = badgeText
            badgeLabel.sizeToFit()
            layoutSubviews()
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
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if badgeText != nil {
            let padding = max(badgeSize.height - badgeLabel.frame.size.height, 0)
            
            badgeLabel.frame.size = CGSize(width: max(badgeLabel.bounds.size.width + padding, 15), height: badgeSize.height)
        }
        
        badgeLabel.frame.origin = CGPoint(x: bounds.size.width - badgeLabel.bounds.size.width / 2, y: -badgeLabel.bounds.size.height / 2)
        badgeLabel.layer.cornerRadius = badgeLabel.bounds.size.height / 2
    }
    
}