//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

let viewBackgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.9, alpha: 0.9)
let secondaryColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
let trimColor = UIColor(red: 0.75, green: 0.0, blue: 0.1, alpha: 0.9)

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var tvButton: UIButton!
    
    @IBOutlet weak var swipePad: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
   
    @IBAction func presentModalViewController(sender: UISwipeGestureRecognizer!) {
        
        println("function called")
        let mDC = ModalDialogController()
        mDC.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        mDC.viewController = self
        self.presentViewController(mDC, animated: true, completion: nil)
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        swipePad.backgroundColor = secondaryColor
        swipePad.textColor = viewBackgroundColor
        let swipeLayer = swipePad.layer
        swipeLayer.cornerRadius = 5
        swipeLayer.borderColor = trimColor.CGColor
        swipeLayer.borderWidth = 5
        
        swipePad.clipsToBounds = true
        self.view.backgroundColor = viewBackgroundColor
        tvButton.backgroundColor = secondaryColor
        tvButton.setTitleColor(viewBackgroundColor, forState: .Normal)
        let buttonLayer = tvButton.layer
        buttonLayer.cornerRadius = 5
        buttonLayer.borderWidth = 3
        buttonLayer.borderColor = trimColor.CGColor
        tvButton.clipsToBounds = true
        tvButton.addTarget(self, action: "showTableViewController:", forControlEvents: .TouchUpInside)
        titleLabel.textColor = secondaryColor
        let titleLayer = titleLabel.layer
        titleLayer.backgroundColor = trimColor.CGColor
        titleLayer.cornerRadius = 5
        
        
    }
    
    func showTableViewController(sender: AnyObject!) {
        self.performSegueWithIdentifier("show", sender: self)
    }
    
    func dismissModal() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


class ModalDialogController: UIViewController {
    var viewController : ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = viewBackgroundColor
        
        let image = UIImage(named: "SmallLucy")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        let imageBorder = UIView()
        imageBorder.backgroundColor = secondaryColor
        let borderLayer = imageBorder.layer
        borderLayer.cornerRadius = 5
        //borderLayer.borderWidth = 3
        //borderLayer.borderColor = trimColor.CGColor
        imageBorder.addSubview(imageView)
        self.view.addSubview(imageBorder)
        
        let button: UIButton = UIButton.buttonWithType(.System) as UIButton
        button.setTitle("Dismiss", forState: .Normal)
        button.setTitle("ByeBye!", forState: .Highlighted)
        button.setTitleColor(viewBackgroundColor, forState: .Normal)
        button.backgroundColor = secondaryColor
        let buttonLayer = button.layer
        buttonLayer.cornerRadius = 5
        buttonLayer.borderWidth = 2
        buttonLayer.borderColor = trimColor.CGColor
        button.addTarget(self, action: "dismissModal:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        imageBorder.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        let borderWidth = NSLayoutConstraint(item: imageBorder, attribute: .Width, relatedBy: .Equal, toItem: imageView, attribute: .Width, multiplier: 1, constant: 12)
        let borderHeight = NSLayoutConstraint(item: imageBorder, attribute: .Height, relatedBy: .Equal, toItem: imageView, attribute: .Height, multiplier: 1, constant: 12)
        let borderHorCenter = NSLayoutConstraint(item: imageBorder, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let borderVerCenter = NSLayoutConstraint(item: imageBorder, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0)
        
        let imageHorCenter = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: imageBorder, attribute: .CenterX, multiplier: 1, constant: 0)
        let imageVerCenter = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: imageBorder, attribute: .CenterY, multiplier: 1, constant: 0)
        
        let buttonHorizontalCenter = NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let buttonWidth = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 60)
        let buttonHeight = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 30)
        let buttonFloor = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: imageBorder, attribute: .Bottom, multiplier: 1, constant: 8)
        
        let constraints = [borderWidth, borderHeight, borderHorCenter, borderVerCenter, imageHorCenter, imageVerCenter, buttonHorizontalCenter, buttonFloor, buttonHeight, buttonWidth]
        
        NSLayoutConstraint.activateConstraints(constraints)
        
    }
    
    //let myDrawColorPattern
    

    
    func dismissModal(sender: AnyObject!){
        self.viewController!.dismissModal()
        
    }
}



