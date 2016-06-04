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
                containerView.addSubview(sut)
                containerView.layoutIfNeeded()
            }
            
            it("should have the badgeView set") {
                expect(sut.badgeLabel).toNot(beNil())
            }
            
            it("should set the default size of the badge") {
                expect(sut.badgeLabel.bounds.size).to(equal(CGSize(width: 15, height: 15)))
            }
            
            it("should position the badge on the top right corner of the button") {
                expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(32.5, within: 0.1))
                expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(32.5, within: 0.1))
            }
            
            it("should initially hide the badge") {
                expect(sut.badgeLabel.hidden).to(beTrue())
            }
            
            it("should set the cornerRadius of the badge to half of the badge's height") {
                expect(sut.badgeLabel.layer.cornerRadius).to(beCloseTo(7.5, within: 0.1))
            }
            
            it("should align the text on the center") {
                expect(sut.badgeLabel.textAlignment).to(equal(NSTextAlignment.Center))
            }
            
            context("when setting the badge's text") {
            
                beforeEach {
                    sut.badgeText = "199"
                }
                
                it("should set the badge text") {
                    expect(sut.badgeLabel.text).to(equal("199"))
                }
                
                it("should adapt the badge width to the text size") {
                    expect(sut.badgeLabel.bounds.size.width).to(beCloseTo(28.6, within: 1))
                }
                
                it("should adapt the badge origin to the new width") {
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(25.6, within: 1))
                }
                
                context("when setting the badge text to nil") {
                
                    beforeEach {
                        sut.badgeText = nil
                    }
                    
                    it("should hide the badge") {
                        expect(sut.badgeLabel.hidden).to(beTrue())
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
