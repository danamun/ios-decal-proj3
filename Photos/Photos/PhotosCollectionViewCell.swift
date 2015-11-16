//
//  PhotosCollectionViewCell.swift
//  Photos
//
//  Created by Da Y Mun on 11/14/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var catPawIcon: UIImageView!
    
    /* The number of likes the picture has. */
    var likes : Int!
    /* The username of the photographer. */
    var username : String!
    /* The profile of the photographer. */
    var profilePic : UIImageView = UIImageView()
    /* The time the photo was created. */
    var timeCreated : String!

    override func awakeFromNib() {
        let gesture = UITapGestureRecognizer(target: self, action:Selector("onTap:"))
        gesture.numberOfTapsRequired = 1
        contentView.addGestureRecognizer(gesture)
        catPawIcon?.hidden = true
        super.awakeFromNib()
        // Initialization code
    }
    
    func onTap(sender:AnyObject) {
        catPawIcon?.hidden = false
        catPawIcon?.alpha = 1.0
        UIView.animateWithDuration(1.0, animations: {
            self.catPawIcon?.alpha = 0
            
            }, completion: {
                (value:Bool) in
                
                self.catPawIcon?.hidden = true
        })
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            let photoVC: PhotoViewController = PhotoViewController()
            photoVC.un = self.username!
            photoVC.pp = self.profilePic.image
            photoVC.im = self.image.image
            photoVC.li = String(self.likes)
            photoVC.tc = self.timeCreated
            (self.window?.rootViewController as! UINavigationController).pushViewController(photoVC, animated: true)
        }
        
    }

    
}
