//
//  Photo.swift
//  Photos
//
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    /* The profile of the photographer. */
    var profilePic : String!
    /* The time the photo was created. */
    var timeCreated : String!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        likes = data.objectForKey("likes")?.valueForKey("count") as! Int
        url = data.objectForKey("images")?.objectForKey("standard_resolution")?.valueForKey("url") as! String
        username = data.objectForKey("user")?.valueForKey("username") as! String
        timeCreated = data.valueForKey("created_time") as! String
        profilePic = data.objectForKey("user")?.valueForKey("profile_picture") as! String
    }
}