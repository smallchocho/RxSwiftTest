//
//  ViewController.swift
//  RXSwiftTest
//
//  Created by Justin Huang on 2018/4/8.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    private var user = User()
    private let disposeBag = DisposeBag()
    var clickedFlag:Bool = true
    
    @IBAction func settingButtonClicked(_ sender:UIButton){
        if clickedFlag {
            user.name.accept("Lancelote")
            user.phoneNumber.accept("098888888")
            user.emailAddress.accept("bigchocho")
            clickedFlag = false
            return
        }
        user.name.accept("Justin")
        user.phoneNumber.accept("099999999")
        user.emailAddress.accept("smallchocho")
        clickedFlag = true
        
    }
    fileprivate func setViewData(){
        user.name.asObservable().map({
            (text) -> String in
            switch text{
            case "Justin":
                return "俊帥的" + "Justin"
            case "Lancelote":
                return "反叛的" + "Lancelote"
            default :
                return text!
            }
        }).bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        user.phoneNumber.asObservable().bind(to: phoneNumberLabel.rx.text).disposed(by: disposeBag)
        user.emailAddress.asObservable().bind(to: emailAddressLabel.rx.text).disposed(by: disposeBag)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

