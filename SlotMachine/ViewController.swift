//
//  ViewController.swift
//  SlotMachine
//
//  Created by Doug Gosciak on 2014/10/25.
//  Copyright (c) 2014 Douglas Gosciak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    var titleLabel: UILabel!
    
    // Information Labels
    
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0

    let kNumberOfContainers = 3
    let kNumberOfSlots = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: self.view.bounds.origin.y,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(
            x:  self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height + secondContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * (kSixth)))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(
            x:  self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height + secondContainer.frame.height +
                thirdContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * (kSixth)))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
//        self.titleLabel.font = UIFont(name: "Chalkduster", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                
                // Solution from Eliot Arntz class notes
//                slotImageView.frame = CGRect(
//                    x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
//                    y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
//                    width: containerView.bounds.width * kThird - kMarginForSlot,
//                    height: containerView.bounds.height * kThird - kMarginForSlot)

                // Better solution from SnappedCoffee
//                slotImageView.frame = CGRect(
//                    x: containerView.bounds.origin.x + kMarginForSlot + ((containerView.bounds.size.width - kMarginForSlot) * CGFloat(containerNumber) * kThird),
//                    y: containerView.bounds.origin.y + kMarginForSlot + ((containerView.bounds.size.height - kMarginForSlot) * CGFloat(slotNumber) * kThird),
//                    width: (containerView.bounds.width - kMarginForSlot) * kThird - kMarginForSlot,
//                    height: (containerView.bounds.height - kMarginForSlot) * kThird - kMarginForSlot)
                
                // Best solution as regards flexibility and UI/UX factors from SnappedCoffee
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + kMarginForSlot + ((containerView.bounds.size.width - kMarginForSlot) * CGFloat(containerNumber) / CGFloat(kNumberOfContainers)),
                    y: containerView.bounds.origin.y + kMarginForSlot + ((containerView.bounds.size.height - kMarginForSlot) * CGFloat(slotNumber) / CGFloat(kNumberOfSlots)),
                    width: (containerView.bounds.width - kMarginForSlot) / CGFloat(kNumberOfContainers) - kMarginForSlot,
                    height: (containerView.bounds.height - kMarginForSlot) / CGFloat(kNumberOfSlots) - kMarginForSlot)
                
                containerView.addSubview(slotImageView)
            }
        }
    }

    // Solution from Eliot Arntz class notes
//    func setupThirdContainer(containerView: UIView) {
//        
//        self.creditsLabel = UILabel()
//        self.creditsLabel.text = "000000"
//        self.creditsLabel.textColor = UIColor.redColor()
//        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
//        self.creditsLabel.sizeToFit()
//        self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
//        self.creditsLabel.textAlignment = NSTextAlignment.Center
//        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
//        containerView.addSubview(self.creditsLabel)
//        
//        self.betLabel = UILabel()
//        self.betLabel.text = "0000"
//        self.betLabel.textColor = UIColor.redColor()
//        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
//        self.betLabel.sizeToFit()
//        self.betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
//        self.betLabel.textAlignment = NSTextAlignment.Center
//        self.betLabel.backgroundColor = UIColor.darkGrayColor()
//        containerView.addSubview(self.betLabel)
//        
//        self.winnerPaidLabel = UILabel()
//        self.winnerPaidLabel.text = "000000"
//        self.winnerPaidLabel.textColor = UIColor.redColor()
//        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
//        self.winnerPaidLabel.sizeToFit()
//        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
//        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
//        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
//        containerView.addSubview(self.winnerPaidLabel)
//
//    }
    
    // Solution provided by Sheldon & Eliot Arntz class notes
    func setupThirdContainer(containerView: UIView) {
        self.creditsLabel = UILabel()
        self.betLabel = UILabel()
        self.winnerPaidLabel = UILabel()
        
        setupLabel(creditsLabel, containerView: containerView, position: 0, size: 6)
        setupLabel(betLabel, containerView: containerView, position: 1, size: 4)
        setupLabel(winnerPaidLabel, containerView: containerView, position: 2, size: 6)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth,
            y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 3,
            y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * 5,
            y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    func setupLabel(slotLabel: UILabel, containerView: UIView, position: Int, size: Int) {
        var zeroes: String = ""
        slotLabel.text = zeroes.stringByPaddingToLength(size, withString: "0", startingAtIndex: 0)
        slotLabel.textColor = UIColor.redColor()
        slotLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        slotLabel.sizeToFit()
        slotLabel.center = CGPoint(
            x: containerView.frame.width * kSixth * CGFloat(position * 2 + 1),
            y: containerView.frame.height * kThird)
        slotLabel.textAlignment = NSTextAlignment.Center
        slotLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(slotLabel)
    }
}

