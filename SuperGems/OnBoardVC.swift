//
//  OnBoardVC.swift
//  SuperGems
//
//  Created by iOS Developer on 05/04/18.
//  Copyright © 2018 Niyati. All rights reserved.
//

import UIKit

class OnBoardVC: UIViewController,UIScrollViewDelegate {

    @IBOutlet var scrOnBoard: UIScrollView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnContact: UIButton!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet var btnEmail: UIButton!
    @IBOutlet var pageController: UIPageControl!
    
    var arrOnBoard = NSMutableArray()
    var dictData = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        getOnBoardData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseClick(_ sender: Any) {
        let storyTab = UIStoryboard(name: "Main", bundle: nil)
        let objForgotPasswordVC = storyTab.instantiateViewController(withIdentifier: "DashboradVC")
        self.navigationController?.pushViewController(objForgotPasswordVC, animated: true)
    }
    
    // MARK: - Custom Methods
    @objc func setScrollViewData(){
        //Scrollview
        scrOnBoard.delegate =  self
        scrOnBoard.isPagingEnabled = true
        let imageWidth:CGFloat = self.scrOnBoard.frame.size.width
        let imageHeight:CGFloat = self.scrOnBoard.frame.size.height
        var xPosition:CGFloat = 0
        var scrollViewContentSize:CGFloat=0;
        
        //set scrollview width
        let scrollViewWidth:CGFloat = imageWidth * CGFloat(arrOnBoard.count)
        scrOnBoard.contentSize = CGSize(width: scrollViewWidth , height: imageHeight)
        
        self.pageController.numberOfPages = (arrOnBoard.count + 1)
        self.pageController.currentPage = 0//set page indicator
        
        //Display Initile Data
        let dic1 = arrOnBoard[self.pageController.currentPage] as! NSDictionary
        lblSubTitle.text =  dic1[kkeysubTitle] as? String
        lblTitle.text = dic1[kkeytitle] as? String
        btnEmail.setTitle(" \((dic1[kkeysubemailId] as? String)!)", for: .normal)
        btnContact.setTitle(" \((dic1[kkeycontactNumber] as? String)!)", for: .normal)
        
        //For image display
        for index in (0..<arrOnBoard.count)
        {
            let dic = arrOnBoard[index] as! NSDictionary
            let strurl = dic[kkeyimage] as! String
            let url  = URL.init(string: strurl)
            let myImageView:UIImageView = UIImageView()
            myImageView.frame.size.width = imageWidth
            myImageView.frame.size.height = imageHeight
            myImageView.frame.origin.x = xPosition
            myImageView.frame.origin.y = 0
            myImageView.sd_setImage(with: url, placeholderImage: nil)
            
            scrOnBoard.addSubview(myImageView)
            
            let spacer:CGFloat = 0
            xPosition+=imageWidth + spacer
            scrollViewContentSize+=imageWidth + spacer
        }
    }
    
    // MARK: - Scrollview Methods
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        print("Page Controller:\(self.pageController.currentPage)")
        print(Int(currentPage))
        print(arrOnBoard.count)
        
        if (arrOnBoard.count - 1) == (self.pageController.currentPage) {
            let storyTab = UIStoryboard(name: "Main", bundle: nil)
            let objForgotPasswordVC = storyTab.instantiateViewController(withIdentifier: "DashboradVC")
            self.navigationController?.pushViewController(objForgotPasswordVC, animated: true)
        }else{
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        
        
//        print(Int(currentPage))
//        print(arrOnBoard.count)
        
        if (arrOnBoard.count - 1) == (self.pageController.currentPage){
//            let storyTab = UIStoryboard(name: "Main", bundle: nil)
//            let objForgotPasswordVC = storyTab.instantiateViewController(withIdentifier: "DashboradVC")
//            self.navigationController?.pushViewController(objForgotPasswordVC, animated: true)
        }else{
            self.pageController.currentPage = Int(currentPage);
            let dic1 = arrOnBoard[Int(currentPage)] as! NSDictionary
            lblSubTitle.text =  dic1[kkeysubTitle] as? String
            lblTitle.text = dic1[kkeytitle] as? String
            btnEmail.setTitle(" \((dic1[kkeysubemailId] as? String)!)", for: .normal)
            btnContact.setTitle(" \((dic1[kkeycontactNumber] as? String)!)", for: .normal)
        }
    }
    
    //MARK: Get OnBoard data
    func getOnBoardData()
    {
        let dic = UserDefaults.standard.value(forKey: kkeyLoginData)
        let final  = NSKeyedUnarchiver .unarchiveObject(with: dic as! Data) as! NSDictionary
        
        let url = kServerURL + kOnBoard
        showProgress(inView: self.view)
        
        let token = final .value(forKey: "userToken")
        let headers = ["Authorization":"Bearer \(token!)"]
        
        request(url, method: .get, parameters:nil, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            print(response.result.debugDescription)
            hideProgress()
            
            switch(response.result)
            {
            case .success(_):
                if response.result.value != nil
                {
                    print(response.result.value!)
                    
                    if let json = response.result.value
                    {
                        let dictemp = json as! NSDictionary
                        print("dictemp :> \(dictemp)")
                        
                        if (dictemp.value(forKey: "error") != nil)
                        {
                            let msg = ((dictemp.value(forKey: "error") as! NSDictionary) .value(forKey: "reason"))
                            App_showAlert(withMessage: msg as! String, inView: self)
                        }
                        else
                        {
                            self.arrOnBoard = NSMutableArray(array: dictemp.value(forKey: "data") as! NSArray)
                            
                            self.perform(#selector(self.setScrollViewData), with: nil, afterDelay: 0.3)
                        }
                    }
                }
                break
            case .failure(_):
                print(response.result.error!)
                self.dictData = NSMutableDictionary()
                App_showAlert(withMessage: response.result.error.debugDescription, inView: self)
                break
            }
        }
    }

}
