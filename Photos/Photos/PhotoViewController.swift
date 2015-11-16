//
//  PhotoViewController.swift
//  Photos
//
//  Created by Da Y Mun on 11/15/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var un: String!
    var pp: UIImage!
    var im: UIImage!
    var li: String!
    var tc: String!
    
    var pawClicked: Bool = false
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var catPawIcon: UIImageView!
    @IBOutlet weak var hearButton: UIButton!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var timeCreated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action:Selector("onTap:"))
        gesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(gesture)
        catPawIcon?.hidden = true

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.translucent = false
        hearButton.layer.cornerRadius = 3.0
        username.text = un
        profilePic.image = pp
        profilePic.layer.cornerRadius = 25.0
        profilePic.layer.masksToBounds = true
        image.image = im
        likes.text =  li + " likes"
        timeCreated.text = tc + "m"
        
        drawLine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawLine() {
        let line = UIView(frame: CGRectMake(hearButton.frame.origin.x - 20, 425, 330, 0.3))
        line.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(line)
    }

    func onTap(sender:AnyObject) {
        changePawColor()
        catPawIcon?.hidden = false
        catPawIcon?.alpha = 1.0
        UIView.animateWithDuration(1.0, animations: {
        self.catPawIcon?.alpha = 0
        
        }, completion: {
            (value:Bool) in
            self.catPawIcon?.hidden = true
        })

    }

    @IBAction func pawClicked(sender: AnyObject) {
        changePawColor()
    }

    func changePawColor() {
        pawClicked = !pawClicked
        if (pawClicked) {
            self.hearButton.backgroundColor = UIColor.redColor()
        } else {
            self.hearButton.backgroundColor = UIColor.lightGrayColor()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
