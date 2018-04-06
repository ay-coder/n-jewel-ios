//
//  SideMenuController.swift
//  SJSwiftNavigationController
//
//  Created by Mac on 12/19/16.
//  Copyright © 2016 Sumit Jagdev. All rights reserved.
//

import UIKit

class SideMenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var menuTableView : UITableView!
    @IBOutlet weak var menuTableHeightCT : NSLayoutConstraint!

    @IBOutlet var viewfooter: UIView!
    var menuItems : NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuTableView.estimatedRowHeight = CGFloat(163).getProprtionalHeight()
        self.menuTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        self.menuTableView.tableFooterView = self.viewfooter
        
//        menuTableHeightCT.constant = 88.0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuTableView.allowsSelection = true
        menuTableView.isUserInteractionEnabled = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(159).getProprtionalHeight()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Sidebar2
            cell.selectionStyle = .none

            switch indexPath.row
            {
                case 0:
                    cell.lblTitle.text = "View Cart"
                    cell.btnImage.setImage(UIImage.init(named: "viewcart"), for: .normal)
                    break
                case 1:
                    cell.lblTitle.text = "Trade Shows"
                    cell.btnImage.setImage(UIImage.init(named: "schedule"), for: .normal)
                    break
                default:
                    break
            }
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        SJSwiftSideMenuController.hideLeftMenu()
        switch indexPath.row
        {
            case 0:
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = storyBoard.instantiateViewController(withIdentifier: "ViewCartVC") as! ViewCartVC
                rootVC.bPresent = true
                self.present(rootVC, animated: true)
                break
            case 1:
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = storyBoard.instantiateViewController(withIdentifier: "DashboradVC") as! DashboradVC
                rootVC.isMenu = true
                SJSwiftSideMenuController.pushViewController(rootVC, animated: true)
                break
            default:
                break
        }
    }
  
    // MARK: - Action Method
    @IBAction func btnLogOutClick(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: kkeyisUserLogin)
        UserDefaults.standard.synchronize()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as UIViewController
        SJSwiftSideMenuController.pushViewController(rootVC, animated: true)
    }
}

class Sidebar2 : UITableViewCell
{
    @IBOutlet var btnImage: UIButton!
    @IBOutlet weak var lblTitle : UILabel!
}
