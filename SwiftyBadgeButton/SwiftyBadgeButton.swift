//
//  SwiftyBadgeButton.swift
//  SwiftyBadgeButton
//
//  Created by Raphael Cruzeiro on 04/06/16.
//  Copyright © 2016 Raphael Cruzeiro. All rights reserved.
//

import Foundation

class SwiftyBadgeButton: UIButton {

    let badgeLabel = UILabel()
    
    var badgeSize = CGSize(width: 15, height: 15) {
        didSet {
            badgeLabel.frame.size = badgeSize
            layoutSubviews()
        }
    }
    
    var badgeText: String? {
        didSet {
            badgeLabel.hidden = badgeText == nil
            badgeLabel.text = badgeText
            badgeLabel.sizeToFit()
            layoutSubviews()
        }
    }
    
    var badgeBackgroundColor = UIColor.redColor() {
        didSet {
            badgeLabel.backgroundColor = badgeBackgroundColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init() {
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        badgeLabel.frame.origin = CGPoint(x: bounds.size.width - badgeLabel.bounds.size.width / 2, y: bounds.size.height - badgeLabel.bounds.size.height / 2)
        badgeLabel.layer.cornerRadius = badgeLabel.bounds.size.height / 2
    }
    
}