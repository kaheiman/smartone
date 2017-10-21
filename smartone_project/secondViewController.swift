//
//  secondViewController.swift
//  smartone_project
//
//  Created by Marcus Man on 22/10/2017.
//  Copyright © 2017 Marcus Man. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var topimg: UIImageView!
    @IBOutlet weak var bot_img: UIImageView!
    var bot = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func changeImage(_ sender: Any) {
        view.bringSubview(toFront: bot_img)
        topimg.isHidden = true
        view.bringSubview(toFront: newBtn)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    view.addSubview(mapView)
//    view.bringSubview(toFront: showAroundBtn)
//    view.bringSubview(toFront: editLocationBtn)
//
//    view.bringSubview(toFront: suggestionRouteContainer)

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
