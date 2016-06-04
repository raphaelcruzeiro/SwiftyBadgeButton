//
//  SwiftyBadgeButtonTests.swift
//  SwiftyBadgeButtonTests
//
//  Created by Raphael Cruzeiro on 04/06/16.
//  Copyright © 2016 Raphael Cruzeiro. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyBadgeButton

class SwiftyBadgeButtonSpecs: QuickSpec {
    
    override func spec() {
        
        describe("SwiftyBadgeButton") {
        
            var containerView: UIView!
            var sut: SwiftyBadgeButton!
            
            beforeEach {
                containerView =  UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 1200))
                sut = SwiftyBadgeButton(frame: CGRect(x: 10, y: 50, width: 40, height: 40))
            }
            
            it("should have the badgeView set") {
                expect(sut.badgeView).toNot(beNil())
            }
            
        }
        
    }
    
}
