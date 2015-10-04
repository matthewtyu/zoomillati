//
//  ViewController.swift
//  zoominati
//
//  Created by Jenny Wong on 10/3/15.
//  Copyright (c) 2015 shdacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = drawTriangle(pickedImage);
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func drawTriangle (originalImage: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(originalImage.size);
        let context = UIGraphicsGetCurrentContext();

        originalImage.drawAtPoint(CGPointMake(0, 0));
        //draw line on top of the image
        CGContextSetLineWidth(context, 50.0);
        CGContextMoveToPoint(context, originalImage.size.width/2, 0);
        CGContextAddLineToPoint(context, originalImage.size.width/2, originalImage.size.width/4);
        CGContextAddLineToPoint(context, originalImage.size.width/4, originalImage.size.width/4);
        CGContextAddLineToPoint(context, originalImage.size.width/2, 0);
        let red = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        CGContextSetStrokeColorWithColor(context, red.CGColor);
        CGContextStrokePath(context);
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    
}

