//
//  CalculateMenuController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import Foundation
import UIKit

class CalculateMenuController: UIViewController {
    
    private var externalWindow: UIWindow?
    
    let calculatorDisplay: UILabel = UILabel()
    let zeroButton: UILabel = UILabel()
    let oneButton: UILabel = UILabel()
    let twoButton: UILabel = UILabel()
    let threeButton: UILabel = UILabel()
    let fourButton: UILabel = UILabel()
    let fiveButton: UILabel = UILabel()
    let sixButton: UILabel = UILabel()
    let sevenButton: UILabel = UILabel()
    let eightButton: UILabel = UILabel()
    let nineButton: UILabel = UILabel()
    let gestureAreaLabel: UILabel = UILabel()
    
    var isTypingNumber = false
    public var firstNumber: Int? = 0
    public var secondNumber = 0
    public var operation = ""
    public var result = 0;
    
    var equation: String = ""
    var equationHistory: [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        equationHistory = retrieveFromJsonFile()
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        
        //divide screen height into four sections
        let heightSection: CGFloat = screenSize.height/4
        
        //divide screen width into three sections
        let widthSection: CGFloat = screenSize.width/3
        
        //button border constant
        let borderSize: CGFloat = 2.0
        
        //output area
        calculatorDisplay.text = ""
        calculatorDisplay.font = UIFont.systemFont(ofSize: 35)
        calculatorDisplay.textColor = UIColor.black
        calculatorDisplay.backgroundColor = UIColor.white
        calculatorDisplay.textAlignment = NSTextAlignment.center
        calculatorDisplay.frame = CGRect(x: widthSection*1, y: heightSection*0, width: screenSize.width-widthSection, height: heightSection)
        calculatorDisplay.layer.cornerRadius = 10.0
        calculatorDisplay.clipsToBounds = true
        self.view.addSubview(calculatorDisplay)
        
        //0 button area
        zeroButton.text = "0"
        zeroButton.textColor = UIColor.white
        zeroButton.layer.borderColor = UIColor.black.cgColor
        zeroButton.layer.borderWidth = borderSize
        zeroButton.backgroundColor = UIColor.orange
        zeroButton.textAlignment = NSTextAlignment.center
        zeroButton.frame = CGRect(x: widthSection*0, y: widthSection*0, width: screenSize.width/3, height: heightSection*1)
        zeroButton.isUserInteractionEnabled = true
        zeroButton.layer.cornerRadius = 10.0
        zeroButton.clipsToBounds = true
        zeroButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushZero(_:))))
        self.view.addSubview(zeroButton)
        
        //1 button area
        oneButton.text = "1"
        oneButton.textColor = UIColor.white
        oneButton.layer.borderColor = UIColor.black.cgColor
        oneButton.layer.borderWidth = borderSize
        oneButton.backgroundColor = UIColor.orange
        oneButton.textAlignment = NSTextAlignment.center
        oneButton.frame = CGRect(x: widthSection*0, y: heightSection*1, width: screenSize.width/3, height: heightSection*2/3)
        oneButton.isUserInteractionEnabled = true
        oneButton.layer.cornerRadius = 10.0
        oneButton.clipsToBounds = true
        oneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushOne(_:))))
        self.view.addSubview(oneButton)
        
        //2 button area
        twoButton.text = "2"
        twoButton.textColor = UIColor.white
        twoButton.layer.borderColor = UIColor.black.cgColor
        twoButton.layer.borderWidth = borderSize
        twoButton.backgroundColor = UIColor.orange
        twoButton.textAlignment = NSTextAlignment.center
        twoButton.frame = CGRect(x: widthSection*1, y: heightSection*1, width: screenSize.width/3, height: heightSection*2/3)
        twoButton.isUserInteractionEnabled = true
        twoButton.layer.cornerRadius = 10.0
        twoButton.clipsToBounds = true
        twoButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushTwo(_:))))
        self.view.addSubview(twoButton)
        
        //3 button area
        threeButton.text = "3"
        threeButton.textColor = UIColor.white
        threeButton.layer.borderColor = UIColor.black.cgColor
        threeButton.layer.borderWidth = borderSize
        threeButton.backgroundColor = UIColor.orange
        threeButton.textAlignment = NSTextAlignment.center
        threeButton.frame = CGRect(x: widthSection*2, y: heightSection*1, width: screenSize.width/3, height: heightSection*2/3)
        threeButton.isUserInteractionEnabled = true
        threeButton.layer.cornerRadius = 10.0
        threeButton.clipsToBounds = true
        threeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushThree(_:))))
        self.view.addSubview(threeButton)
        
        //4 button area
        fourButton.text = "4"
        fourButton.textColor = UIColor.white
        fourButton.layer.borderColor = UIColor.black.cgColor
        fourButton.layer.borderWidth = borderSize
        fourButton.backgroundColor = UIColor.orange
        fourButton.textAlignment = NSTextAlignment.center
        fourButton.frame = CGRect(x: widthSection*0, y: heightSection*5/3, width: screenSize.width/3, height: heightSection*2/3)
        fourButton.isUserInteractionEnabled = true
        fourButton.layer.cornerRadius = 10.0
        fourButton.clipsToBounds = true
        fourButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushFour(_:))))
        self.view.addSubview(fourButton)
        
        //5 button area
        fiveButton.text = "5"
        fiveButton.textColor = UIColor.white
        fiveButton.layer.borderColor = UIColor.black.cgColor
        fiveButton.layer.borderWidth = borderSize
        fiveButton.backgroundColor = UIColor.orange
        fiveButton.textAlignment = NSTextAlignment.center
        fiveButton.frame = CGRect(x: widthSection*1, y: heightSection*5/3, width: screenSize.width/3, height: heightSection*2/3)
        fiveButton.isUserInteractionEnabled = true
        fiveButton.layer.cornerRadius = 10.0
        fiveButton.clipsToBounds = true
        fiveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushFive(_:))))
        self.view.addSubview(fiveButton)
        
        //6 button area
        sixButton.text = "6"
        sixButton.textColor = UIColor.white
        sixButton.layer.borderColor = UIColor.black.cgColor
        sixButton.layer.borderWidth = borderSize
        sixButton.backgroundColor = UIColor.orange
        sixButton.textAlignment = NSTextAlignment.center
        sixButton.frame = CGRect(x: widthSection*2, y: heightSection*5/3, width: screenSize.width/3, height: heightSection*2/3)
        sixButton.isUserInteractionEnabled = true
        sixButton.layer.cornerRadius = 10.0
        sixButton.clipsToBounds = true
        sixButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushSix(_:))))
        self.view.addSubview(sixButton)
        
        //7 button area
        sevenButton.text = "7"
        sevenButton.textColor = UIColor.white
        sevenButton.layer.borderColor = UIColor.black.cgColor
        sevenButton.layer.borderWidth = borderSize
        sevenButton.backgroundColor = UIColor.orange
        sevenButton.textAlignment = NSTextAlignment.center
        sevenButton.frame = CGRect(x: widthSection*0, y: heightSection*7/3, width: screenSize.width/3, height: heightSection*2/3)
        sevenButton.isUserInteractionEnabled = true
        sevenButton.layer.cornerRadius = 10.0
        sevenButton.clipsToBounds = true
        sevenButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushSeven(_:))))
        self.view.addSubview(sevenButton)
        
        //8 button area
        eightButton.text = "8"
        eightButton.textColor = UIColor.white
        eightButton.layer.borderColor = UIColor.black.cgColor
        eightButton.layer.borderWidth = borderSize
        eightButton.backgroundColor = UIColor.orange
        eightButton.textAlignment = NSTextAlignment.center
        eightButton.frame = CGRect(x: widthSection*1, y: heightSection*7/3, width: screenSize.width/3, height: heightSection*2/3)
        eightButton.isUserInteractionEnabled = true
        eightButton.layer.cornerRadius = 10.0
        eightButton.clipsToBounds = true
        eightButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushEight(_:))))
        self.view.addSubview(eightButton)
        
        //9 button area
        nineButton.text = "9"
        nineButton.textColor = UIColor.white
        nineButton.layer.borderColor = UIColor.black.cgColor
        nineButton.layer.borderWidth = borderSize
        nineButton.backgroundColor = UIColor.orange
        nineButton.textAlignment = NSTextAlignment.center
        nineButton.frame = CGRect(x: widthSection*2, y: heightSection*7/3, width: screenSize.width/3, height: heightSection*2/3)
        nineButton.isUserInteractionEnabled = true
        nineButton.layer.cornerRadius = 10.0
        nineButton.clipsToBounds = true
        nineButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushNine(_:))))
        self.view.addSubview(nineButton)
        
        //gesture area
        gestureAreaLabel.backgroundColor = UIColor.darkGray
        gestureAreaLabel.text = ""
        gestureAreaLabel.textColor = UIColor.white
        gestureAreaLabel.textAlignment = NSTextAlignment.center
        gestureAreaLabel.frame = CGRect(x: 0, y: heightSection*3, width: screenSize.width, height: heightSection)
        gestureAreaLabel.isUserInteractionEnabled = true
        gestureAreaLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.openMainMenu(_:))))
        self.view.addSubview(gestureAreaLabel)
        
        //swipe right - add
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.add(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        gestureAreaLabel.addGestureRecognizer(swipeRight)
        
        //swipe left - subtract
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.subtract(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        gestureAreaLabel.addGestureRecognizer(swipeLeft)
        
        //swipe down - clear
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.clear(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        gestureAreaLabel.addGestureRecognizer(swipeDown)
        
        //swipe up - equals
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.equals(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        gestureAreaLabel.addGestureRecognizer(swipeUp)
        
        //set background color
        self.view.backgroundColor = UIColor.black
    }
    
    @objc func pushZero(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: zeroButton)
        gestureAreaLabel.text = "0"
    }
    
    @objc func pushOne(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: oneButton)
        gestureAreaLabel.text = "1"
    }
    
    @objc func pushTwo(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: twoButton)
        gestureAreaLabel.text = "2"
    }
    
    @objc func pushThree(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: threeButton)
        gestureAreaLabel.text = "3"
    }
    
    @objc func pushFour(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: fourButton)
        gestureAreaLabel.text = "4"
    }
    
    @objc func pushFive(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: fiveButton)
        gestureAreaLabel.text = "5"
    }
    
    @objc func pushSix(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: sixButton)
        gestureAreaLabel.text = "6"
    }
    
    @objc func pushSeven(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: sevenButton)
        gestureAreaLabel.text = "7"
    }
    
    @objc func pushEight(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: eightButton)
        gestureAreaLabel.text = "8"
    }
    
    @objc func pushNine(_ recognizer: UITapGestureRecognizer) {
        numberTapped(sender: nineButton)
        gestureAreaLabel.text = "9"
    }
    
    @objc func add(_ recognizer: UITapGestureRecognizer) {
        calculationTapped(symbol: "+")
        gestureText(symbol: "+")
    }
    
    @objc func subtract(_ recognizer: UITapGestureRecognizer) {
        calculationTapped(symbol: "-")
        gestureText(symbol: "-")
    }
    
    @objc func clear(_ recognizer: UITapGestureRecognizer) {
        calculatorDisplay.text = "0"
        firstNumber = 0
        secondNumber = 0
        operation = ""
        isTypingNumber = false
        gestureText(symbol: "clear")
    }
    
    @objc func equals(_ recognizer: UITapGestureRecognizer) {
        equalsTapped()
        gestureText(symbol: "=")
    }
    
    @IBAction func numberTapped(sender: UILabel) {
        let number: String = sender.text!
        
        if isTypingNumber {
            calculatorDisplay.text = calculatorDisplay.text! + number
        } else {
            calculatorDisplay.text = number
            isTypingNumber = true
        }
    }
    
    func calculationTapped(symbol: String) {
        isTypingNumber = false
        firstNumber = Int(calculatorDisplay.text!)
        operation = symbol
    }
    
    @IBAction func equalsTapped() {
        isTypingNumber = false
        result = 0
        secondNumber = Int(calculatorDisplay.text!)!
        
        if operation == "+" {
            result = firstNumber! + secondNumber
        } else if operation == "-" {
            result = firstNumber! - secondNumber
        }

        calculatorDisplay.text = "\(result)"
        
        //prevent saving if already returned results
        if(firstNumber == 0 && secondNumber == 0){
            return
        }
        
        //save results in history
        equation.append(firstNumber!.description)
        equation.append(" " + operation + " ")
        equation.append(String(secondNumber))
        equation.append(" = ")
        equation.append(String(result))

        equationHistory.append(equation)
        
        saveToJsonFile()
        
        firstNumber = 0
        secondNumber = 0
    }
    
    func saveToJsonFile() {
        // Get the url of equations.json in document directory
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("equations.json")
        // Save it into file
        do {
            let data = try JSONSerialization.data(withJSONObject: equationHistory, options: [])
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }
    
    func retrieveFromJsonFile() -> [String]{
        // Get the url of equations.json in document directory
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return [""]}
        let fileUrl = documentsDirectoryUrl.appendingPathComponent("equations.json")
        // Read data from equations.json file
        do {
            let data = try Data(contentsOf: fileUrl, options: [])
            guard let equationHistory = try JSONSerialization.jsonObject(with: data, options: []) as? [String] else { return [""]}
            return equationHistory
        } catch {
            print(error)
        }
        return [""]
    }

    @objc func gestureText(symbol: String) {
        self.gestureAreaLabel.text = symbol
    }
    
    @objc func openMainMenu(_ recognizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    // Method to set up an external screen.
    private func setupExternalScreen(screen: UIScreen) {
        if externalWindow == nil {
            externalWindow = UIWindow(frame: screen.bounds)
            externalWindow!.rootViewController = ExternalScreenViewController(screen: screen)
            externalWindow!.screen = screen
            externalWindow!.isHidden = false
        }
    }
    
    // Method to handle the notification when an external screen connects.
    @objc func externalScreenDidConnect(notification: NSNotification) {
        guard let screen = notification.object as? UIScreen else {
            return
        }
        setupExternalScreen(screen: screen)
    }
    
    // Method to handle the notification when an external screen disconnects.
    @objc func externalScreenDidDisconnect(notification: NSNotification) {
        guard let _ = notification.object as? UIScreen else {
            return
        }
        if let ew = externalWindow {
            ew.isHidden = true
            externalWindow = nil
        }
    }
}
