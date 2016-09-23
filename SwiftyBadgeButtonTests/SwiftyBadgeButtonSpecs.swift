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
                expect(sut.badgeLabel.isHidden).to(beTrue())
            }
            
            it("should set the cornerRadius of the badge to half of the badge's height") {
                expect(sut.badgeLabel.layer.cornerRadius).to(beCloseTo(7.5, within: 0.1))
            }
            
            it("should align the text on the center") {
                expect(sut.badgeLabel.textAlignment).to(equal(NSTextAlignment.center))
            }
            
            it("should set the badge's clipToBounds to true") {
                expect(sut.badgeLabel.clipsToBounds).to(beTrue())
            }
            
            it("should set the default background color") {
                expect(sut.badgeLabel.backgroundColor).to(equal(UIColor.red))
            }
            
            it("should set the default font") {
                expect(sut.badgeLabel.font.pointSize).to(equal(10))
            }
            
            it("should set the default text color") {
                expect(sut.badgeLabel.textColor).to(equal(UIColor.white))
            }
            
            context("when adding an inset to the badge") {
            
                it("should correctly calculate x when there's a positive left inset") {
                    sut.badgeInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(37.5, within: 1))
                    expect(sut.badgeLabel.frame.size.width).to(equal(10))
                }
                
                it("should correctly calculate x when there's a negative left inset") {
                    sut.badgeInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(27.5, within: 1))
                    expect(sut.badgeLabel.frame.size.width).to(equal(20))
                }
                
                it("should correctly calculate x when there's a negative left inset and a negative right inset") {
                    sut.badgeInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: -5)
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(27.5, within: 1))
                    expect(sut.badgeLabel.frame.size.width).to(equal(15))
                }
                
                it("should correctly calculate x when there's a positive top inset") {
                    sut.badgeInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-2.5, within: 1))
                    expect(sut.badgeLabel.frame.size.height).to(equal(10))
                }
                
                it("should correctly calculate x when there's a negative top inset") {
                    sut.badgeInset = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-12.5, within: 1))
                    expect(sut.badgeLabel.frame.size.height).to(equal(20))
                }
                
                it("should correctly calculate x when there's a negative top inset and a negative bottom inset") {
                    sut.badgeInset = UIEdgeInsets(top: -5, left: 0, bottom: -5, right: 0)
                    expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-12.5, within: 1))
                    expect(sut.badgeLabel.frame.size.height).to(equal(15))
                }
                
            }
            
            context("when adding an inset to the badge") {
            
                it("should correctly calculate x when there's a positive left inset") {
                    sut.badgeInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(37.5, within: 1))
                    expect(sut.badgeLabel.frame.size.width).to(equal(10))
                }
                
                it("should correctly calculate x when there's a negative left inset") {
                    sut.badgeInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(27.5, within: 1))
                    expect(sut.badgeLabel.frame.size.width).to(equal(20))
                }
                
                it("should correctly calculate x when there's a negative left inset and a negative right inset") {
                    sut.badgeInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: -5)
                    expect(sut.badgeLabel.frame.origin.x).to(beCloseTo(27.5, within: 1))
                    expect(sut.badgeLabel.frame.size.width).to(equal(15))
                }
                
                it("should correctly calculate x when there's a positive top inset") {
                    sut.badgeInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-2.5, within: 1))
                    expect(sut.badgeLabel.frame.size.height).to(equal(10))
                }
                
                it("should correctly calculate x when there's a negative top inset") {
                    sut.badgeInset = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
                    expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-12.5, within: 1))
                    expect(sut.badgeLabel.frame.size.height).to(equal(20))
                }
                
                it("should correctly calculate x when there's a negative top inset and a negative bottom inset") {
                    sut.badgeInset = UIEdgeInsets(top: -5, left: 0, bottom: -5, right: 0)
                    expect(sut.badgeLabel.frame.origin.y).to(beCloseTo(-12.5, within: 1))
                    expect(sut.badgeLabel.frame.size.height).to(equal(15))
                }
                
            }
            
            context("changing the badge's properties") {
            
                it("should correctly change the background color") {
                    sut.badgeBackgroundColor = .green
                    expect(sut.badgeLabel.backgroundColor).to(equal(UIColor.green))
                }
                
                it("should correctly change the badgeLabel font") {
                    sut.badgeFont = UIFont.systemFont(ofSize: 9)
                    expect(sut.badgeLabel.font.pointSize).to(equal(9))
                }
                
                it("should correctly change the badgeLabel text color") {
                    sut.badgeTextColor = .blue
                    expect(sut.badgeLabel.textColor).to(equal(UIColor.blue))
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
                    expect(sut.badgeLabel.isHidden).to(beFalse())
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
                        expect(sut.badgeLabel.isHidden).to(beTrue())
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
                    expect(sut.badgeLabel.isHidden).to(beFalse())
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
