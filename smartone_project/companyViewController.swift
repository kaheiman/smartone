//
//  companyViewController.swift
//  smartone_project
//
//  Created by Marcus Man on 22/10/2017.
//  Copyright © 2017 Marcus Man. All rights reserved.
//

import UIKit

class companyViewController: UIViewController {

    var name = ["asdasd", "adasd", "dqwdwq"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension companyViewController: UITableViewDelegate, UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count: ", name.count)
        return name.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! companyTableViewCell

        cell.companyName.text = name[indexPath.row]
        print("######")

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
        print("ggggg")
    }


}
