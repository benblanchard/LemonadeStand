//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Ben Blanchard on 08/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var lemonStockLabel: UILabel!
    @IBOutlet weak var iceStockLabel: UILabel!
    @IBOutlet weak var lemonPurchaseLabel: UILabel!
    @IBOutlet weak var icePurchaseLabel: UILabel!
    @IBOutlet weak var lemonMixLabel: UILabel!
    @IBOutlet weak var iceMixLabel: UILabel!
    
    var lemonStock = 0
    var iceStock = 0
    var cash = 0
    var lemonPurchased = 0
    var icePurchased = 0
    var lemonMixed = 0
    var iceMixed = 0
    var mixRatio:Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        cash = 10
        lemonStock = 1
        iceStock = 1
        updateView()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startDayButtonPressed(sender: AnyObject) {
        println("Day started!")
        if lemonMixed <= 0 || iceMixed <= 0 {
            showAlertWithText(message: "You must add at least one of each item to the mix")
        }
        else {
            mixRatio = Double(lemonMixed)/Double(iceMixed)
            println("Mix Ratio: \(mixRatio)")
        }
        
        

        
    }
    
    
    // PURCHASE AND UNPURCHASE BUTTONS

    @IBAction func lemonPurchaseAddButtonPressed(sender: AnyObject) {
        println("Purchase 1 lemon")
        
        if cash < 2 {
            showAlertWithText(header: "Warning", message: "You don't have enough money!")
        } else {
            lemonPurchased += 1
            lemonStock += 1
            cash -= 2
            updateView()
        }
    }
    
    @IBAction func lemonPurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 lemon")
        
        if lemonPurchased <= 0 {
            showAlertWithText(header: "Unable to sell", message: "You can't sell lemons")
        } else if lemonStock <= 0 {
            showAlertWithText(message: "You can't have a negative amount of lemons. Remove some from the mix")
        } else {
            lemonPurchased -= 1
            lemonStock -= 1
            cash += 2
            updateView()
        }

    }
    
    @IBAction func icePurchaseAddButtonPressed(sender: AnyObject) {
        println("Purchase 1 ice cube")
        
        if cash < 1 {
            showAlertWithText(header: "Warning", message: "You don't have enough money!")
        } else {
            icePurchased += 1
            iceStock += 1
            cash -= 1
            updateView()
        }
        
    }
    
    @IBAction func icePurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 ice cube")
       
        if icePurchased <= 0 {
            showAlertWithText(header: "Unable to sell", message: "You can't sell ice")
        } else if iceStock <= 0 {
            showAlertWithText(message: "You can't have a negative amount of ice cubes. Remove some from the mix")
        } else {
            icePurchased -= 1
            iceStock -= 1
            cash += 1
            updateView()
        }
        
    }
    
    //
    
    // MIX AND UNMIX BUTTONS

    @IBAction func lemonMixAddButtonPressed(sender: AnyObject) {
        println("Add 1 lemon to mix")
        if lemonStock <= 0 {
            showAlertWithText(message: "No more lemons!")
        }
        else {
            lemonStock -= 1
            lemonMixed += 1
            updateView()
        }
    }

    @IBAction func lemonMixMinusButtonPressed(sender: AnyObject) {
        println("Remove 1 lemon from mix")
        
        if lemonMixed <= 0 {
            showAlertWithText(message: "No more lemons from mix!")
        }
        else {
            lemonStock += 1
            lemonMixed -= 1
            updateView()
        }
    }
    
    @IBAction func iceMixAddButtonPressed(sender: AnyObject) {
        println("Add 1 ice cube to mix")
        if iceStock <= 0 {
            showAlertWithText(message: "No more ice!")
        }
        else {
            iceStock -= 1
            iceMixed += 1
            updateView()
        }
    }
    
    @IBAction func iceMixMinusButtonPressed(sender: AnyObject) {
        println("Remove 1 ice cube from mix")
        
        if iceMixed <= 0 {
            showAlertWithText(message: "No more ice from mix!")
        }
        else {
            iceStock += 1
            iceMixed -= 1
            updateView()
        }
    }
    
    //

    func updateView() {
        lemonStockLabel.text = "\(lemonStock) lemons"
        iceStockLabel.text = "\(iceStock) ice cubes"
        cashLabel.text = "$\(cash)"
        icePurchaseLabel.text = "\(icePurchased)"
        lemonPurchaseLabel.text = "\(lemonPurchased)"
        lemonMixLabel.text = "\(lemonMixed)"
        iceMixLabel.text = "\(iceMixed)"
    }
    
    func showAlertWithText(header:String = "Warnings", message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

