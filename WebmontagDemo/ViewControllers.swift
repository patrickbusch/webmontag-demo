//
//  ViewController.swift
//  WebmontagDemo
//
//  Created by Patrick Busch on 15/03/16.
//  Copyright © 2016 Patrick Busch. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let data = Data.get
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Hellooo, it's me!"
        self.collectionView!.backgroundColor = UIColor.blackColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let edge = UIScreen.mainScreen().bounds.size.width / CGFloat(2) - CGFloat(10)
        return CGSizeMake(edge, edge)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> WMCell {
        
        let cell: WMCell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as! WMCell
        
        let row = indexPath.row
        
        cell.titleLabel.text = "@" + data[row].0
        ImageLoader.load(data[row].1) { image in
            let cell = collectionView.cellForItemAtIndexPath(indexPath) as? WMCell
            cell?.backgroundImage.image = image
            cell?.backgroundImage.alpha = 0.7
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        
        let webViewController = WebViewController.create("https://twitter.com/" + data[row].0)
        webViewController.title = data[row].0
        (UIApplication.sharedApplication().windows[0].rootViewController as! MainNavigationController).pushViewController(webViewController, animated: true)
    }
}

class WMCell : UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        
        backgroundImage.image = nil
        titleLabel.text = ""
    }
}