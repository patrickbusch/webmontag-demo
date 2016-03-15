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
        ("LeisUlf","https://abs.twimg.com/sticky/default_profile_images/default_profile_5_400x400.png"),
        ("sn0opy","https://pbs.twimg.com/profile_images/524867427557863425/ODznwKdv.png"),
        ("crookoo","https://pbs.twimg.com/profile_images/3425075104/dc9e3c52758111284309d19016a45f3e_400x400.jpeg"),
        ("vitamin_J","https://pbs.twimg.com/profile_images/1597443718/Bildschirmfoto_2011-10-20_um_07.45.47_400x400.png"),
        ("pippo3","https://pbs.twimg.com/profile_images/637603940/christian_small_400x400.jpg"),
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

class WebViewController : UIViewController {
    
    static func create(url: String) -> WebViewController {
        let controller = WebViewController()
        controller.url = url
        controller.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        controller.loadViewIfNeeded()
        return controller
    }
    
    private var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webView = UIWebView()
        webView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        self.view.addSubview(webView)
        
        let requestObj = NSURLRequest(URL: NSURL(string: url!)!)
        webView.loadRequest(requestObj)
    }
}