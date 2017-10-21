//
//  lastPageViewController.swift
//  smartone_project
//
//  Created by Marcus Man on 22/10/2017.
//  Copyright © 2017 Marcus Man. All rights reserved.
//

import UIKit

class lastPageViewController: UIViewController {

    @IBOutlet weak var botImg: UIImageView!
    @IBOutlet weak var middleBtn: UIButton!
    @IBOutlet weak var topImage: UIImageView!
    var left = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func middlebtn(_ sender: Any) {
        if(!left){
            botImg.image = UIImage(named: "last_bot_02")
            middleBtn.imageView?.image = UIImage(named: "last_btn_02")
            topImage.image = UIImage(named: "last_page_02")
        } else{
            botImg.image = UIImage(named: "last_bot_01")
            middleBtn.imageView?.image = UIImage(named: "last_btn_01")
            topImage.image = UIImage(named: "last_page_01")
        }
        left = !left
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
