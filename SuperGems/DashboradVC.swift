//
//  DashboradVC.swift
//  SuperGems
//
//  Created by Yash on 19/11/17.
//  Copyright © 2017 Niyati. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class DashboradVC: UIViewController 
{
    @IBOutlet var swipeMenuView: SwipeMenuView!
    @IBOutlet weak var btnFeatured : UIButton!
    @IBOutlet weak var btnWhatsNew : UIButton!
    @IBOutlet weak var btnCategories : UIButton!

    @IBOutlet weak var imgFeatured : UIImageView!
    @IBOutlet weak var imgWhatsNew : UIImageView!
    @IBOutlet weak var imgCategories : UIImageView!

    var iSelectedTab = Int()
    var isMenu = Bool()
    
    var arrWhatsNewData = NSMutableArray()
    var arrCategoryData = NSMutableArray()
    var dictFeaturedData = NSMutableDictionary()
    var arrScheduleData = NSMutableArray()
    var arrproducts = NSMutableArray()
    var arrScrollProduct = NSMutableArray()
    
    @IBOutlet weak var clWhatsNew : UICollectionView!
    
    @IBOutlet weak var vwFeatured : UIView!
    @IBOutlet weak var vwWhatsNew : UIView!
    @IBOutlet weak var vwCategories : UIView!
    @IBOutlet var vwShedule: UIView!
    
    //FeaturedView Configuration
    @IBOutlet weak var imgNewFeatured : UIImageView!
    @IBOutlet weak var lblNewFeaturedTitle : UILabel!
    @IBOutlet weak var lblNewFeaturedSubTitle : UILabel!
    @IBOutlet weak var tblFeatured : UITableView!

    //Category View
    @IBOutlet weak var clCategory : UICollectionView!
    var arrCategorySectionSelection = NSMutableArray()

    //Schedule View
    @IBOutlet var tblSchedule: UITableView!
    
    @IBOutlet var scrollFeatured: UIScrollView!
    @IBOutlet var pageControll: UIPageControl!
    
    var array = ["FEATURED","WHAT'S NEW", "CATEGORIES", "TRADE SHOWS"]
    var dataCount: Int = 4
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        
//        var dic = NSMutableDictionary()
//        dic[kkeydate] = "January 20 – January 22, 2018"
//        dic[kkeyshow] = "JIS – Jewelers International Show"
//        dic[kkeylocation] = "Double Tree by Hilton Hotel Miami Airport 711 NW 72nd Ave, Miami, FL 33126"
//        arrScheduleData.add(dic)
//        
//        dic = NSMutableDictionary()
//        dic[kkeydate] = "January 30 - February 04, 2018"
//        dic[kkeyshow] = "GJX - Gem and Jewelry Exchange"
//        dic[kkeylocation] = "Tucson Convention Center 411 W Congress St, Tucson, AZ 85701"
//        arrScheduleData.add(dic)
//        
//        dic = NSMutableDictionary()
//        dic[kkeydate] = "March 11 - March 13, 2018"
//        dic[kkeyshow] = "JA - New York Spring"
//        dic[kkeylocation] = "Double Tree by Hilton Hotel Miami Airport 711 NW 72nd Ave, Miami, FL 33126"
//        arrScheduleData.add(dic)
//        
//        dic = NSMutableDictionary()
//        dic[kkeydate] = "January 20 – January 22, 2018"
//        dic[kkeyshow] = "JIS – Jewelers International Show"
//        dic[kkeylocation] = "Double Tree by Hilton Hotel Miami Airport 711 NW 72nd Ave, Miami, FL 33126"
//        arrScheduleData.add(dic)
        
        
        //Scrollview Data
//        arrScrollProduct = NSMutableArray()
//
//        dic = NSMutableDictionary()
//        dic[kkeyproductImage] = "1"
//        arrScrollProduct.add(dic)
//
//        dic = NSMutableDictionary()
//        dic[kkeyproductImage] = "2"
//        arrScrollProduct.add(dic)
//
//        dic = NSMutableDictionary()
//        dic[kkeyproductImage] = "3"
//        arrScrollProduct.add(dic)
//
//        dic = NSMutableDictionary()
//        dic[kkeyproductImage] = "4"
//        arrScrollProduct.add(dic)
//
//        dic = NSMutableDictionary()
//        dic[kkeyproductImage] = "5"
//        arrScrollProduct.add(dic)
//
//        dic = NSMutableDictionary()
//        dic[kkeyproductImage] = "6"
//        arrScrollProduct.add(dic)
        
       

        
        self.navigationController?.navigationBar.isHidden = true
        
        // Do any additional setup after loading the view.
        SJSwiftSideMenuController.enableDimBackground = true
        SJSwiftSideMenuController.enableSwipeGestureWithMenuSide(menuSide: .LEFT)

        self.tblFeatured.estimatedRowHeight = 150;
        self.tblFeatured.rowHeight = UITableViewAutomaticDimension;
        
        self.tblSchedule.estimatedRowHeight = 155;
        self.tblSchedule.rowHeight = UITableViewAutomaticDimension;
        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
//        swipeRight.direction = UISwipeGestureRecognizerDirection.right
//        self.view.addGestureRecognizer(swipeRight)
//        
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
//        swipeDown.direction = UISwipeGestureRecognizerDirection.left
//        self.view.addGestureRecognizer(swipeDown)
        
        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self
        
        
        var options: SwipeMenuViewOptions = .init()
        options.tabView.height                          = 33
        options.tabView.style                           = .flexible
        options.tabView.margin                          = 8.0
        options.tabView.underlineView.backgroundColor   = UIColor.init(red: 223/255, green: 176/255, blue: 73/255, alpha: 1.0)
        options.tabView.backgroundColor                 = UIColor.clear
        options.tabView.underlineView.height            = 3.0
        options.tabView.itemView.textColor              = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        options.tabView.itemView.selectedTextColor      = UIColor.init(red: 223/255, green: 176/255, blue: 73/255, alpha: 1.0)
        options.tabView.itemView.margin                 = 10.0
        options.tabView.itemView.font                   = UIFont.init(name: "Raleway-Regular", size: 14)!
        options.contentScrollView.backgroundColor       = UIColor.clear
        swipeMenuView.reloadData(options: options)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        iSelectedTab = 1
        if isMenu{
            iSelectedTab = 4
            swipeMenuView.currentIndex = 0
            swipeMenuView.jumpingToIndex = 3
            print(iSelectedTab)
            swipeMenuView.jump(to: 3, animated: true)
            print(iSelectedTab)
        }
        self.SetButtonSelected(iTag: iSelectedTab)
    }
    
    
    // MARK: - Custom Scrollview Methods
    @objc func setScrollViewData(){
        //Scrollview
        scrollFeatured.delegate =  self
        scrollFeatured.isPagingEnabled = true
        let imageWidth:CGFloat = self.scrollFeatured.frame.size.width
        let imageHeight:CGFloat = self.scrollFeatured.frame.size.height
        var xPosition:CGFloat = 0
        var scrollViewContentSize:CGFloat=0;
        
        //set scrollview width
        let scrollViewWidth:CGFloat = imageWidth * CGFloat(arrScrollProduct.count)
        scrollFeatured.contentSize = CGSize(width: scrollViewWidth , height: imageHeight)
        
        self.pageControll.numberOfPages = arrScrollProduct.count
        self.pageControll.currentPage = 0//set page indicator
        
        //Display Initile Data
        let dic1 = arrScrollProduct[self.pageControll.currentPage] as! NSDictionary
        lblNewFeaturedSubTitle.text =  dic1[kkeysubTitle] as? String
        lblNewFeaturedTitle.text = dic1[kkeytitle] as? String
        
        
        //For image display
        for index in (0..<arrScrollProduct.count)
        {
            let dic = arrScrollProduct[index] as! NSDictionary
            let strurl = dic[kkeyimage] as! String
            let url  = URL.init(string: strurl)
//            let myImage:UIImage = UIImage(named: dic[kkeyimage] as! String)!
            let myImageView:UIImageView = UIImageView()
            myImageView.frame.size.width = imageWidth
            myImageView.frame.size.height = imageHeight
            myImageView.frame.origin.x = xPosition
            myImageView.frame.origin.y = 0
//            myImageView.image = myImage
            myImageView.sd_setImage(with: url, placeholderImage: nil)

            scrollFeatured.addSubview(myImageView)
            
            let spacer:CGFloat = 0
            xPosition+=imageWidth + spacer
            scrollViewContentSize+=imageWidth + spacer
        }
    }
    
    // MARK: - Scrollview Methods
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControll.currentPage = Int(currentPage);
        
        let dic1 = arrScrollProduct[Int(currentPage)] as! NSDictionary
        lblNewFeaturedSubTitle.text =  dic1[kkeysubTitle] as? String
        lblNewFeaturedTitle.text = dic1[kkeytitle] as? String
    }
   
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.right:
                
                if iSelectedTab > 1
                {
                    iSelectedTab = iSelectedTab - 1
                    self.SetButtonSelected(iTag: iSelectedTab)
                }
                print("Swiped right")
                
            case UISwipeGestureRecognizerDirection.left:
                if iSelectedTab < 3
                {
                    iSelectedTab = iSelectedTab + 1
                    self.SetButtonSelected(iTag: iSelectedTab)

                }
                print("Swiped left")
            default:
                break
            }
        }
    }
    
    func SetButtonSelected(iTag: Int)
    {
        iSelectedTab = iTag
 
        if iTag == 1
        {
            vwFeatured.isHidden = false
            vwWhatsNew.isHidden = true
            vwCategories.isHidden = true
            vwShedule.isHidden = true
            self.getFeaturedData()
        }
        else if iTag == 2
        {
            vwFeatured.isHidden = true
            vwWhatsNew.isHidden = false
            vwCategories.isHidden = true
            vwShedule.isHidden = true
            self.getWhatsNewData()

        }
        else if iTag == 3
        {
            vwFeatured.isHidden = true
            vwWhatsNew.isHidden = true
            vwCategories.isHidden = false
            vwShedule.isHidden = true
            self.getCategoryData()
        }
        else if iTag == 4
        {
            vwFeatured.isHidden = true
            vwWhatsNew.isHidden = true
            vwCategories.isHidden = true
            vwShedule.isHidden = false
            self.getScheduleData()
        }
    }
        // MARK: - StatusBar Color Change Method
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    //MARK: Get Product Data
    func getWhatsNewData()
    {
        let dic = UserDefaults.standard.value(forKey: kkeyLoginData)
        let final  = NSKeyedUnarchiver .unarchiveObject(with: dic as! Data) as! NSDictionary
        
        let url = kServerURL + kWhatsNewAPI
        showProgress(inView: self.view)
        //        ShowProgresswithImage(inView: nil, image:UIImage(named: "icon_discoverloading"))
        
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
                            self.arrWhatsNewData = NSMutableArray(array: dictemp.value(forKey: "data") as! NSArray)
                        }
                        self.clWhatsNew.reloadData()
                    }
                }
                break
                
            case .failure(_):
                print(response.result.error!)
                self.clWhatsNew.reloadData()
                App_showAlert(withMessage: response.result.error.debugDescription, inView: self)
                break
            }
        }
    }
    
    //MARK: Get Category data
    func getCategoryData()
    {
        let dic = UserDefaults.standard.value(forKey: kkeyLoginData)
        let final  = NSKeyedUnarchiver .unarchiveObject(with: dic as! Data) as! NSDictionary
        
        let url = kServerURL + kcategories
        showProgress(inView: self.view)
        //        ShowProgresswithImage(inView: nil, image:UIImage(named: "icon_discoverloading"))
        
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
                            self.arrCategoryData = NSMutableArray(array: dictemp.value(forKey: "data") as! NSArray)
                            
                            if self.iSelectedTab == 1
                            {
                                self.tblFeatured.reloadData()
                            }
                            else
                            {
                                self.arrCategorySectionSelection = NSMutableArray()
                                for i in 0..<self.arrCategoryData.count
                                {
                                    self.arrCategorySectionSelection.add(kNO)
                                }
                                self.clCategory.reloadData()
                            }
                        }
                    }
                }
                break
            case .failure(_):
                print(response.result.error!)
                self.arrCategoryData = NSMutableArray()
                App_showAlert(withMessage: response.result.error.debugDescription, inView: self)
                break
            }
        }
    }

    //MARK: Get Schedule data
    func getScheduleData()
    {
        let dic = UserDefaults.standard.value(forKey: kkeyLoginData)
        let final  = NSKeyedUnarchiver .unarchiveObject(with: dic as! Data) as! NSDictionary
        
        let url = kServerURL + kschedule
        showProgress(inView: self.view)
        //        ShowProgresswithImage(inView: nil, image:UIImage(named: "icon_discoverloading"))
        
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
                            self.arrScheduleData = NSMutableArray(array: dictemp.value(forKey: "data") as! NSArray)
                            self.tblSchedule.reloadData()
                            
                        }
                    }
                }
                break
            case .failure(_):
                print(response.result.error!)
                self.arrCategoryData = NSMutableArray()
                App_showAlert(withMessage: response.result.error.debugDescription, inView: self)
                break
            }
        }
    }
    
    //MARK: Get featured data
    func getFeaturedData()
    {
        let dic = UserDefaults.standard.value(forKey: kkeyLoginData)
        let final  = NSKeyedUnarchiver .unarchiveObject(with: dic as! Data) as! NSDictionary
        
        let url = kServerURL + kFeaturedData
        showProgress(inView: self.view)
        //        ShowProgresswithImage(inView: nil, image:UIImage(named: "icon_discoverloading"))
        
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
                            self.dictFeaturedData = NSMutableDictionary(dictionary: dictemp.value(forKey: "data") as! NSDictionary)
                            
//                            let dic = self.dictFeaturedData["featured"] as! NSDictionary
                            self.arrScrollProduct = (self.dictFeaturedData["featuredData"] as! NSArray).mutableCopy() as! NSMutableArray

//                            let strurl = dic["image"] as! String
//                            let url  = URL.init(string: strurl)
//                            self.imgNewFeatured.sd_setImage(with: url, placeholderImage: nil)
                            
//                            self.lblNewFeaturedTitle.text = dic[kkeytitle] as? String
//                            self.lblNewFeaturedSubTitle.text = dic[kkeysubtitle] as? String
                            self.perform(#selector(self.setScrollViewData), with: nil, afterDelay: 0.3)
                            self.getCategoryData()
                        }
                    }
                }
                break
            case .failure(_):
                print(response.result.error!)
                self.dictFeaturedData = NSMutableDictionary()
                App_showAlert(withMessage: response.result.error.debugDescription, inView: self)
                break
            }
        }
    }

    
    //MARK: Button Action
    @IBAction func btnChangedTabAction(_ sender: UIButton)
    {
        iSelectedTab = sender.tag
        self.SetButtonSelected(iTag: iSelectedTab)
    }
    @IBAction func btnViewCartClicked(_ sender: UIButton)
    {
        let storyTab = UIStoryboard(name: "Main", bundle: nil)
        let objProductDetailVC = storyTab.instantiateViewController(withIdentifier: "ViewCartVC") as! ViewCartVC
        self.navigationController?.pushViewController(objProductDetailVC, animated: true)
    }

    //MARK:- Button Click Action
    @IBAction func btnMenuClicked(sender: UIButton)
    {
        SJSwiftSideMenuController.showLeftMenu()
    }

    func btnRemoveAction(sender:UIButton)
    {
        let intRow = sender.tag
        
        if arrCategorySectionSelection[intRow] as! String == kNO
        {
            arrCategorySectionSelection.replaceObject(at: intRow, with: kYES)
        }
        else
        {
            arrCategorySectionSelection.replaceObject(at: intRow, with: kNO)
        }
        self.clCategory.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension DashboradVC: SwipeMenuViewDelegate,SwipeMenuViewDataSource {
    //MARK - SwipeMenuViewDataSource
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return self.array.count
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return self.array[index]
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = ContentViewController()
        return vc
    }
    
//    func jump(to index: Int, animated: Bool) {
//    }
    
    // MARK - SwipeMenuViewDelegate
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        // Codes
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        // Codes
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        // Codes
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        // Codes
        if isMenu{
            iSelectedTab = 4
            swipeMenuView.currentIndex = 3
            isMenu = false
        }else{
            if toIndex == 0{
                iSelectedTab = 1
            }else if toIndex == 1{
                iSelectedTab = 2
            }else if toIndex == 2{
                iSelectedTab = 3
            }else{
                iSelectedTab = 4
            }
        }
        self.SetButtonSelected(iTag: iSelectedTab)
    }
}
extension DashboradVC : UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var  iHeightofDescription = CGFloat()
        var  iHeightofTitle = CGFloat()
        var  iHeightofPrice = CGFloat()
        
        if  collectionView == self.clCategory
        {
            let dictFeaturedData = NSMutableDictionary(dictionary: self.arrCategoryData[indexPath.section]  as! NSDictionary)
            self.arrproducts = NSMutableArray(array: dictFeaturedData["products"] as! NSArray)
            let dic = self.arrproducts[indexPath.row] as! NSDictionary
            let fontAttributes = [NSFontAttributeName: UIFont (name: "Raleway-Regular", size: 17)]
            var size = (dic[kkeyproductTitle] as! NSString).size(attributes: fontAttributes)
            
            iHeightofTitle = size.height
            
            if let temp = dic[kkeyproductDescription]
            {
                size = (dic[kkeyproductDescription] as! NSString).size(attributes: fontAttributes)
                iHeightofDescription = size.height
            }
            
            size = ("$\(dic[kkeyproductPrice] as! Float)".size(attributes: fontAttributes)) //nidhi
            iHeightofPrice = size.height
        }
        else
        {
            let dic = self.arrWhatsNewData[indexPath.row] as! NSDictionary
            let fontAttributes = [NSFontAttributeName: UIFont (name: "Raleway-Regular", size: 17)]
            var size = (dic[kkeyproductTitle] as! NSString).size(attributes: fontAttributes)
            
            iHeightofTitle = size.height
            
            if let temp = dic[kkeyproductDescription]
            {
                size = (dic[kkeyproductDescription] as! NSString).size(attributes: fontAttributes)
                iHeightofDescription = size.height
            }
            
//              size = ("$\(dic[kkeyproductPrice] as! Int)".size(attributes: fontAttributes))
            size = ("$\(dic[kkeyproductPrice] as! Float)".size(attributes: fontAttributes)) //nidhi
            iHeightofPrice = size.height
        }

        return CGSize(width: MainScreen.width/2, height: (200.0 + iHeightofTitle + iHeightofDescription + iHeightofPrice))
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        if  collectionView == self.clCategory
        {
            return self.arrCategoryData.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if  collectionView == self.clWhatsNew
        {
            return self.arrWhatsNewData.count
        }
        else
        {
            if arrCategorySectionSelection[section] as! String == kYES
            {
                let dictFeaturedData = NSMutableDictionary(dictionary: self.arrCategoryData[section]  as! NSDictionary)
                let arrtempcount = NSMutableArray(array: dictFeaturedData["products"] as! NSArray)
                return arrtempcount.count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let identifier = "WhatsNewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,for:indexPath) as! WhatsNewCell
        
        if  collectionView == self.clWhatsNew
        {
            let dic = self.arrWhatsNewData[indexPath.row] as! NSDictionary
            let strurl = dic[kkeyproductImage] as! String
            let url  = URL.init(string: strurl)
            cell.imgProduct.sd_setImage(with: url, placeholderImage: nil)
            
            cell.lblProductName.text = dic[kkeyproductTitle] as? String
            cell.lblProductDescription.text = dic[kkeyproductDescription] as? String
            cell.lblPrice.text = "$\(dic[kkeyproductPrice] as! Float)" //nidhi
        }
        else
        {
            let dictFeaturedData = NSMutableDictionary(dictionary: self.arrCategoryData[indexPath.section]  as! NSDictionary)
            self.arrproducts = NSMutableArray(array: dictFeaturedData["products"] as! NSArray)
            let dic = self.arrproducts[indexPath.row] as! NSDictionary
            let strurl = dic[kkeyproductImage] as! String
            let url  = URL.init(string: strurl)
            cell.imgProduct.sd_setImage(with: url, placeholderImage: nil)
            
            cell.lblProductName.text = dic[kkeyproductTitle] as? String
            cell.lblProductDescription.text = dic[kkeyproductDescription] as? String
            cell.lblPrice.text = "$\(dic[kkeyproductPrice] as! Float)"

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        switch kind
        {
            case UICollectionElementKindSectionHeader:
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryCollectionReusableView", for: indexPath) as! CategoryCollectionReusableView
            
                let dic = self.arrCategoryData[indexPath.section] as! NSDictionary
            
                let strurl = dic[kkeycategoryImage] as! String
                let url  = URL.init(string: strurl)
                reusableview.imgCategory.sd_setImage(with: url, placeholderImage: nil)
            
                reusableview.lblCategoryName.text = dic[kkeycategoryTitle] as? String
                reusableview.lblTotalProductCount.text = "\(dic[kkeyproductsCount] as! Int) items —"
                
                reusableview.btnTapped.tag = indexPath.section
                reusableview.btnTapped.addTarget(self, action: #selector(self.btnRemoveAction(sender:)), for: .touchUpInside)

                return reusableview
        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if collectionView == self.clWhatsNew
        {
            return CGSize.zero
        }
        else
        {
            return CGSize(width: MainScreen.width, height: 108)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if  collectionView == self.clWhatsNew
        {
            let storyTab = UIStoryboard(name: "Main", bundle: nil)
            let objProductDetailVC = storyTab.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
             objProductDetailVC.dicofProductDetail = self.arrWhatsNewData[indexPath.row] as! NSDictionary
            self.navigationController?.pushViewController(objProductDetailVC, animated: true)
        }
        else
        {
            let storyTab = UIStoryboard(name: "Main", bundle: nil)
            let objProductDetailVC = storyTab.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
            objProductDetailVC.dicofProductDetail = self.arrproducts[indexPath.row] as! NSDictionary
            self.navigationController?.pushViewController(objProductDetailVC, animated: true)

        }
    }
}
extension DashboradVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.tblSchedule{
            return self.arrScheduleData.count
        }
        return self.arrCategoryData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
//         if tableView == self.tblSchedule{
//            return 122
//        }
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == self.tblFeatured{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedCell", for: indexPath) as! FeaturedCell
            cell.selectionStyle = .none
            let dic = self.arrCategoryData[indexPath.row] as! NSDictionary
            
            let strurl = dic[kkeycategoryImage] as! String
            let url  = URL.init(string: strurl)
            cell.imgCategory.sd_setImage(with: url, placeholderImage: nil)
            
            cell.lblCategoryName.text = dic[kkeycategoryTitle] as? String
            cell.lblTotalProductCount.text = "\(dic[kkeyproductsCount] as! Int) items —"
            
            return cell
        }else if tableView == self.tblSchedule{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleCell
            cell.selectionStyle = .none
            cell.viewDate.layer.cornerRadius = 5
            
            let dic = self.arrScheduleData[indexPath.row] as! NSDictionary
            let startDateTime = dic[kkeyschedulestartdate] as? String
            
            
            let arrStartDate = startDateTime?.components(separatedBy: " ")
            let arrStartDateDivided = arrStartDate![0].components(separatedBy: "-")
            let strStartYear = arrStartDateDivided[0]
            let strStartMonth = arrStartDateDivided[1]
            let strStartDay = arrStartDateDivided[2]
            
            cell.lblDay.text = strStartDay
            cell.lblMonth.text = getMonth(monthValue: strStartMonth).0
            
            let endDateTime = dic[kkeyscheduleenddate] as? String
            let arrEndDate = endDateTime?.components(separatedBy: " ")
            let arrEndDateDivided = arrEndDate![0].components(separatedBy: "-")
//            let strEndYear = arrEndDateDivided[0]
            let strEndMonth = arrEndDateDivided[1]
            let strEndDay = arrEndDateDivided[2]
            
            cell.lblDate.text = strStartDay + " \(getMonth(monthValue: strStartMonth).1)" + " - " + strEndDay + " \(getMonth(monthValue: strEndMonth).1)" + ", \(strStartYear)"
            
            cell.lblScheduleShow.text = dic[kkeyscheduletitle] as? String
            let add1 = dic[kkeyscheduleaddress1] as? String
            let add2 = dic[kkeyscheduleaddress2] as? String
            let add3 = dic[kkeyschedulecity] as? String
            let add4 = dic[kkeyschedulestate] as? String
            let add5 = dic[kkeyschedulezip] as? String
            
            let strAddress = "\(add1!)," + " \(add2!)," + " \(add3!)," + " \(add4!)," + " \(add5!)"
//            cell.lblLocation.numberOfLines = 0
            cell.lblLocation.text = strAddress
//            cell.lblLocation.sizeToFit()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == self.tblFeatured{
            let storyTab = UIStoryboard(name: "Main", bundle: nil)
            let objCategoryDetailVC = storyTab.instantiateViewController(withIdentifier: "CategoryDetailVC") as! CategoryDetailVC
            objCategoryDetailVC.dicofSelectedCategory = self.arrCategoryData[indexPath.row] as! NSDictionary
            self.navigationController?.pushViewController(objCategoryDetailVC, animated: true)
        }
    }
    
    func getMonth(monthValue:String)-> (String,String){
        var strMonth = ""
        var strFullMonth = ""
        switch monthValue {
        case "01":
            strMonth = "Jan"
            strFullMonth = "January"
        case "02":
            strMonth = "Feb"
            strFullMonth = "January"
        case "03":
            strMonth = "Mar"
            strFullMonth = "January"
        case "04":
            strMonth = "Apr"
            strFullMonth = "January"
        case "05":
            strMonth = "May"
            strFullMonth = "January"
        case "06":
            strMonth = "Jun"
            strFullMonth = "January"
        case "07":
            strMonth = "Jul"
            strFullMonth = "January"
        case "08":
            strMonth = "Aug"
            strFullMonth = "January"
        case "09":
            strMonth = "Sep"
            strFullMonth = "January"
        case "10":
            strMonth = "Oct"
            strFullMonth = "January"
        case "11":
            strMonth = "Nov"
            strFullMonth = "January"
        case "12":
            strMonth = "Dec"
            strFullMonth = "January"
        default:
            strMonth = ""
        }
        return (strMonth,strFullMonth)
    }
}

class WhatsNewCell: UICollectionViewCell
{
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!

}
class FeaturedCell: UITableViewCell
{
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblTotalProductCount: UILabel!
}
class CategoryCollectionReusableView: UICollectionReusableView
{
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblTotalProductCount: UILabel!
    @IBOutlet weak var btnTapped: UIButton!

}
class ScheduleCell: UITableViewCell{
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblScheduleShow: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet var viewDate: UIView!
}
