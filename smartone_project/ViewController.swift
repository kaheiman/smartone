//
//  ViewController.swift
//  smartone_project
//
//  Created by Marcus Man on 21/10/2017.
//  Copyright © 2017 Marcus Man. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{


    var imageArray = [UIImage(named: "button1"), UIImage(named: "button2"), UIImage(named: "button1")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.img.image = imageArray[indexPath.row]

        return cell
    }


}

