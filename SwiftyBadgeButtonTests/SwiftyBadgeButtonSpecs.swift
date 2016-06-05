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
                expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-7.5, within: 0.1))
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
            
            it("should set the badge's clipToBounds to true") {
                expect(sut.badgeLabel.clipsToBounds).to(beTrue())
            }
            
            it("should set the default background color") {
                expect(sut.badgeLabel.backgroundColor).to(equal(UIColor.redColor()))
            }
            
            it("should set the default font") {
                expect(sut.badgeLabel.font.pointSize).to(equal(10))
            }
            
            it("should set the default text color") {
                expect(sut.badgeLabel.textColor).to(equal(UIColor.whiteColor()))
            }
            
            context("changing the badge's properties") {
            
                it("should correctly change the background color") {
                    sut.badgeBackgroundColor = .greenColor()
                    expect(sut.badgeLabel.backgroundColor).to(equal(UIColor.greenColor()))
                }
                
                it("should correctly change the badgeLabel font") {
                    sut.badgeFont = UIFont.systemFontOfSize(9)
                    expect(sut.badgeLabel.font.pointSize).to(equal(9))
                }
                
                it("should correctly change the badgeLabel text color") {
                    sut.badgeTextColor = .blueColor()
                    expect(sut.badgeLabel.textColor).to(equal(UIColor.blueColor()))
                }
                
            }
            
            context("when setting the badge text") {
                
                beforeEach {
                    sut.badgeText = "1"
                }
                
                it("should set the badge text") {
                    expect(sut.badgeLabel.text).to(equal("1"))
                }
                
                it("should show the badge") {
                    expect(sut.badgeLabel.hidden).to(beFalse())
                }
                
                it("should adapt the badge width to the text size") {
                    expect(sut.badgeLabel.bounds.size.width).to(beCloseTo(15, within: 1))
                }
                
                it("should adapt the badge origin to the new width") {
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(32.5, within: 1))
                }
                
                it("should maintain the height") {
                    expect(sut.badgeLabel.bounds.size.height).to(equal(15))
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
            
            context("when setting the badge text to more than one character") {
            
                beforeEach {
                    sut.badgeText = "199"
                }
                
                it("should set the badge text") {
                    expect(sut.badgeLabel.text).to(equal("199"))
                }
                
                it("should show the badge") {
                    expect(sut.badgeLabel.hidden).to(beFalse())
                }
                
                it("should adapt the badge width to the text size") {
                    expect(sut.badgeLabel.bounds.size.width).to(beCloseTo(21, within: 1))
                }
                
                it("should adapt the badge origin to the new width") {
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(29.5, within: 1))
                }
                
                it("should maintain the height") {
                    expect(sut.badgeLabel.bounds.size.height).to(equal(15))
                }
                
            }
            
        }
        
    }
    
}
