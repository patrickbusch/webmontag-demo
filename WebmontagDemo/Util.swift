//
//  Util.swift
//  WebmontagDemo
//
//  Created by Patrick Busch on 15/03/16.
//  Copyright © 2016 Patrick Busch. All rights reserved.
//

import Foundation
import UIKit

class Data {
    
    static let get: [(String, String)] = [
        ("mkuehnel","https://pbs.twimg.com/profile_images/692805678818287620/CPj43j_k_400x400.jpg"),
        ("rvrng","https://pbs.twimg.com/profile_images/706516505480011776/PLz34IzI_400x400.jpg"),
        ("oxyfodu","https://pbs.twimg.com/profile_images/530081121841590273/3eKzncMw_400x400.png"),
        ("nuzy_","https://pbs.twimg.com/profile_images/555565556/miramis_projekt0561.de_f13361a2_400x400.jpg"),
        ("chrkhl","https://pbs.twimg.com/profile_images/685791375581904896/9bqNpj35_400x400.png"),
    ]
}

class ImageLoader {
    
    static func load(url: String, delegateFunc: (image: UIImage) -> ()) {
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(string: url)!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            if (error == nil) {
                let image: UIImage? = UIImage(data: data!)
                delegateFunc(image: image!)
            } else {
                print("Error happened while loading image")
            }
        }
    }
}