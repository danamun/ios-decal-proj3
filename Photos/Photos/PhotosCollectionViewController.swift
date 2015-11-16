//
//  PhotosCollectionViewController.swift
//  Photos
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos = [Photo]()
    let cellIdentifier:String = "PhotosCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        collectionView?.registerNib(UINib(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        self.navigationItem.title = "Popular Photos"
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
        
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:PhotosCollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as? PhotosCollectionViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("PhotosCollectionViewCell", owner: self, options: nil)[0] as? PhotosCollectionViewCell
        }
        
        let photo = photos[indexPath.row]
        cell?.username = photo.username
        cell?.likes = photo.likes
        loadImageForCell(photo.profilePic, imageView: (cell?.profilePic)!)
        cell?.timeCreated = photo.timeCreated
        loadImageForCell(photo.url, imageView: (cell?.image)!)
        
        return cell!
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: String, imageView: UIImageView) {
        if let urlString:String? = photo {
            if let url:NSURL? = NSURL(string: urlString!) {
                let request:NSURLRequest = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 5.0)
                
                NSOperationQueue.mainQueue().cancelAllOperations()
                
                NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
                    (response:NSURLResponse?, imageData:NSData?, error:NSError?) -> Void in
                    
                    imageView.image = UIImage(data: imageData!)
                })
            }
        }
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

