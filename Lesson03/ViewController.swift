//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeAreaLabel: UILabel!
    
    @IBOutlet weak var tvButton: UIButton!
    
    @IBOutlet weak var swipePad: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let viewBackgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.9, alpha: 0.9)
    let trimColor = UIColor(red: 0.7, green: 0.7, blue: 0.2, alpha: 1)

    
    @IBAction func showModalDialogue(sender: UISwipeGestureRecognizer) {
        
        sender.cancelsTouchesInView = false
        
        let swipePoint = sender.locationInView(self.view)
        
        if swipeAreaLabel.frame.contains(swipePoint) {
            let mDC = ModalDialogController()
            mDC.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            
            
            self.presentViewController(mDC, animated: true, completion: nil)
        }
        
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipePad.backgroundColor = trimColor
        swipePad.textColor = viewBackgroundColor
        swipePad.layer.cornerRadius = 5
        swipePad.clipsToBounds = true
        self.view.backgroundColor = viewBackgroundColor
        tvButton.backgroundColor = trimColor
        tvButton.setTitleColor(viewBackgroundColor, forState: .Normal)
        tvButton.layer.cornerRadius = 5
        tvButton.clipsToBounds = true
        tvButton.addTarget(self, action: "showTableViewController:", forControlEvents: .TouchUpInside)
        titleLabel.textColor = trimColor
        
    }
    
    func showTableViewController(sender: AnyObject!) {
        self.performSegueWithIdentifier("show", sender: self)
    }
}


class ModalDialogController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewBackgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.9, alpha: 0.9)
        self.view.backgroundColor = viewBackgroundColor
        
        let image = UIImage(named: "SmallLucy")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        let imageBorder = UIView()
        let trimColor = UIColor(red: 0.7, green: 0.7, blue: 0.2, alpha: 1)
        imageBorder.backgroundColor = trimColor
        imageBorder.layer.cornerRadius = 5
        imageBorder.addSubview(imageView)
        self.view.addSubview(imageBorder)
        
        let button: UIButton = UIButton.buttonWithType(.System) as UIButton
        button.setTitle("Dismiss", forState: .Normal)
        button.setTitle("ByeBye!", forState: .Highlighted)
        button.setTitleColor(viewBackgroundColor, forState: .Normal)
        button.backgroundColor = trimColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: "dismissModal:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        imageBorder.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        let borderWidth = NSLayoutConstraint(item: imageBorder, attribute: .Width, relatedBy: .Equal, toItem: imageView, attribute: .Width, multiplier: 1, constant: 8)
        let borderHeight = NSLayoutConstraint(item: imageBorder, attribute: .Height, relatedBy: .Equal, toItem: imageView, attribute: .Height, multiplier: 1, constant: 8)
        let borderHorCenter = NSLayoutConstraint(item: imageBorder, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let borderVerCenter = NSLayoutConstraint(item: imageBorder, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0)
        
        let imageHorCenter = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: imageBorder, attribute: .CenterX, multiplier: 1, constant: 0)
        let imageVerCenter = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: imageBorder, attribute: .CenterY, multiplier: 1, constant: 0)
        
        let buttonHorizontalCenter = NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let buttonWidth = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 55)
        let buttonHeight = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 30)
        let buttonFloor = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: imageBorder, attribute: .Bottom, multiplier: 1, constant: 8)
        
        let constraints = [borderWidth, borderHeight, borderHorCenter, borderVerCenter, imageHorCenter, imageVerCenter, buttonHorizontalCenter, buttonFloor, buttonHeight, buttonWidth]
        
        NSLayoutConstraint.activateConstraints(constraints)
        
    }
    
    func dismissModal(sender: AnyObject!){
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
}



