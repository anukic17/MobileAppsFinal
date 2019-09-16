//
//  ViewController.swift
//  Calculator_Project
//
//  Created by Amel, Nukic  on 3/30/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    let mainMenuLabel: UILabel = UILabel()
    let formulaHeader: UILabel = UILabel()
    
    var tableView = UITableView()
    var tableData = ["Discount" , " Interest", " Tips", " SalesTax", "Average", "Percentage"]
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
        
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let _: CGFloat = screenSize.height / 2
        
        //assign the first tenth of the screen's height to the menu
        let formulaHeaderSection: CGFloat = screenSize.height/11
        
        //button constants
        let buttonHeight: CGFloat = screenSize.height/7
        let buttonWidth: CGFloat = screenSize.width-10
        let buttonX: CGFloat = 5
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = UIColor.gray
        tableView.separatorColor = UIColor.yellow
        tableView.rowHeight = 100
        
        

        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "my")
        view.addSubview(tableView)
        
        //main menuLabel label
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.backgroundColor = UIColor.darkGray
        mainMenuLabel.textColor = UIColor.white
        mainMenuLabel.textAlignment = NSTextAlignment.center
        mainMenuLabel.frame = CGRect(x: buttonX, y: buttonHeight*6-25, width: buttonWidth, height: buttonHeight)
        mainMenuLabel.isUserInteractionEnabled = true
        mainMenuLabel.layer.cornerRadius = 10.0
        mainMenuLabel.clipsToBounds = true
        mainMenuLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.openMainMenu(_:))))
        self.view.addSubview(mainMenuLabel)
        
        self.view.backgroundColor = UIColor.lightGray
        
        //previous data menu header
        formulaHeader.attributedText = NSAttributedString(string: "Favorite Formulas", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        formulaHeader.font = UIFont.systemFont(ofSize: 20)
        formulaHeader.textColor = UIColor.black
        formulaHeader.backgroundColor = UIColor.gray
        formulaHeader.textAlignment = NSTextAlignment.center
        formulaHeader.frame = CGRect(x: centerX/2, y: formulaHeaderSection/14, width: centerX, height: formulaHeaderSection)
        self.view.addSubview(formulaHeader)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath)
        cell.textLabel?.text = " \(tableData[indexPath.row])"
        cell.textLabel!.numberOfLines = 0
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("You selected cell number: \(indexPath.row)!");
        
        //Get cell index
        if indexPath.row == 0 {
            DiscountAlert()
        }
        if indexPath.row == 1 {
            InterestAlert()
        }
        if indexPath.row == 2 {
            TipsAlert()
        }
        if indexPath.row == 3 {
            SalesAlert()
        }
        if indexPath.row == 4 {
            AverageAlert()
        }
        if indexPath.row == 5 {
            PercentageAlert()
        }
    
    }
    
    //method to re-open main menu
    @objc func openMainMenu(_ recognizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    // method to allow multiple lines in table cell
    func allowMultipleLines(tableViewCell:UITableViewCell) {
        tableViewCell.textLabel?.numberOfLines = 2
        tableViewCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    // alert for discount formula
    func DiscountAlert() {
        let Alert = UIAlertController(title: "Formula:", message: "ListPrice * Discount Price", preferredStyle: UIAlertController.Style.alert)
        
        Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            Alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(Alert, animated: true, completion: nil)
        let subview = Alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.yellow
    }
    // alert for Interest formula
    func InterestAlert() {
        let Alert = UIAlertController(title: "Formula:", message: "Principle * Rate * Time", preferredStyle: UIAlertController.Style.alert)
        
        Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            Alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(Alert, animated: true, completion: nil)
        
        let subview = Alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.yellow
    }
    
    // alert for Tips formula
    func TipsAlert() {
        let Alert = UIAlertController(title: "Formula:", message: "Cost * Tip Percentage Rate", preferredStyle: UIAlertController.Style.alert)
        
        Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            Alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(Alert, animated: true, completion: nil)
        let subview = Alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.yellow
    }
    // alert for Sales formula
    func SalesAlert() {
        let Alert = UIAlertController(title: "Formula:", message: "Price Of Item * Tax Rate", preferredStyle: UIAlertController.Style.alert)
        
        Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            Alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(Alert, animated: true, completion: nil)
        let subview = Alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.yellow
    }
    // alert for Averge formula
    func AverageAlert() {
        let Alert = UIAlertController(title: "Formula:", message: "Sum of items / Number of items summed", preferredStyle: UIAlertController.Style.alert)
        
        Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            Alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(Alert, animated: true, completion: nil)
        let subview = Alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.yellow
    }
    // alert for percentage formula
    func PercentageAlert() {
        let Alert = UIAlertController(title: "Formula:", message: "Y / X = ? than ? * 100", preferredStyle: UIAlertController.Style.alert)
        
        Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            Alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(Alert, animated: true, completion: nil)
        let subview = Alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.yellow
    }



   
}

